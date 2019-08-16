
;; cider extensions

;; Fix cider-eval-last-sexp in normal mode
;; https://github.com/syl20bnr/spacemacs/issues/646#issuecomment-106037404
(defadvice cider-last-sexp (around evil activate)
  "In normal-state or motion-state, last sexp ends at point."
  (if (or (evil-normal-state-p) (evil-motion-state-p))
      (save-excursion
        (unless (or (eobp) (eolp)) (forward-char))
        ad-do-it)
    ad-do-it))

;; fix green highligting when eval-ing last-sexp
;; original cider-eval-sexp-fu (comes with the clojure layer)
;;   https://github.com/clojure-emacs/cider-eval-sexp-fu/blob/5687e7b33e17f2be40b036dac82da4a5bc6705fb/cider-eval-sexp-fu.el#L38
(defadvice cider-esf--bounds-of-last-sexp (around evil activate)
  "In normal-state or motion-state, last sexp ends at point."
  (if (or (evil-normal-state-p) (evil-motion-state-p))
      (cons (save-excursion
              (unless (or (eobp) (eolp)) (forward-char))
              ad-do-it))
    ad-do-it))


(defun cider-thing-at-point (thing &optional bounds)
  "Return the thing at point as a string, otherwise nil.
THING being a valid argument for bounds-of-thing-at-point.
If BOUNDS is non-nil, return a list of its starting and ending position
instead."
  (when-let* ((b (or (and (equal (char-after) ?\()
                          (member (char-before) '(?\' ?\, ?\@))
                          ;; hide stuff before ( to avoid quirks with '( etc.
                          (save-restriction
                            (narrow-to-region (point) (point-max))
                            (bounds-of-thing-at-point thing)))
                     (and
                      (eq thing 'sexp)
                      (member (char-after) '(?\) ?\} ?\]))
                      (bounds-of-thing-at-point 'list))
                     (bounds-of-thing-at-point thing))))
    (funcall (if bounds #'list #'buffer-substring-no-properties)
             (car b) (cdr b))))

(defun cider-list-at-point (&optional bounds)
  "Return the list at point as a string, otherwise nil.
If BOUNDS is non-nil, return a list of its starting and ending position
instead."
  (cider-thing-at-point 'list bounds))


(defun cider-eval-list-at-point (&optional output-to-current-buffer)
  "Evaluate the expression around point.
If invoked with OUTPUT-TO-CURRENT-BUFFER, output the result to current buffer."
  (interactive "P")
  (let ((b (cider-list-at-point 'bounds)))
    (cider-eval-region (car b) (cadr b))))

(defun nextjournal/cider-pprint-register (register)
  (interactive (list (register-read-with-preview "Eval register: ")))
  (cider--pprint-eval-form (get-register register)))


(defun cider-interactive-cljs-eval (form &optional callback bounds additional-params)
  "copied from sider but only sending form to :cljs repl"
  (let ((form  (or form (apply #'buffer-substring-no-properties bounds)))
        (start (car-safe bounds))
        (end   (car-safe (cdr-safe bounds))))
    (when (and start end)
      (remove-overlays start end 'cider-temporary t))
    (unless (and cider-interactive-eval-override
                 (functionp cider-interactive-eval-override)
                 (funcall cider-interactive-eval-override form callback bounds))
      (cider-map-repls :cljs
        (lambda (connection)
          (cider--prep-interactive-eval form connection)
          (cider-nrepl-request:eval
           form
           (or callback (cider-interactive-eval-handler nil bounds))
           ;; always eval ns forms in the user namespace
           ;; otherwise trying to eval ns form for the first time will produce an error
           (if (cider-ns-form-p form) "user" (cider-current-ns))
           (when start (line-number-at-pos start))
           (when start (cider-column-number-at-pos start))
           additional-params
           connection))))))

(defun nextjournal/eval-defun-at-point-and-refresh ()
  (interactive)
  (cider-eval-defun-at-point)
  (cider-interactive-cljs-eval "(do (require '[re-frame.core]) (re-frame.core/dispatch [:refresh]))"))

(dolist (m '(clojure-mode
             clojurec-mode
             clojurescript-mode
             clojurex-mode
             cider-repl-mode
             cider-clojure-interaction-mode))
  (spacemacs/set-leader-keys-for-major-mode m

    ;;    "ee" 'cider-eval-sexp-at-point
    "," 'nextjournal/cider-pprint-register
    "ec" 'cider-eval-list-at-point))

(defun nextjournal/add-nextjournal-cljs-repl-type ()
  (when (not (seq-some (lambda (entry) (eq 'nextjournal (first entry))) cider-cljs-repl-types))
    (add-to-list 'cider-cljs-repl-types '(nextjournal "(do (require 'com.nextjournal.journal.repl) (com.nextjournal.journal.repl/wait-for-figwheel) (com.nextjournal.journal.repl/editor-repl))" nil))))

(with-eval-after-load 'cider
  (progn
    ;; automatically reuse cider repl buffers without prompting
    (defadvice cider--choose-reusable-repl-buffer (around auto-confirm compile activate)
      (cl-letf (((symbol-function 'y-or-n-p) (lambda (&rest args) t))
                ((symbol-function 'completing-read) (lambda (prompt collection &rest args) (car collection))))
        ad-do-it))

    (nextjournal/add-nextjournal-cljs-repl-type)))

(dolist (m '(clojurescript-mode
             clojurec-mode
             clojurex-mode
             cider-repl-mode))
  (spacemacs/set-leader-keys-for-major-mode m
    "er" 'nextjournal/eval-defun-at-point-and-refresh))

;;nextjournal specific functions
(defun nextjournal/new-clojure-scratch-buffer (scratch-name)
  (interactive "sScratch file name: ")
  (let* ((scratch-file (expand-file-name (concat "journal/scratch/" scratch-name ".clj")
                                         (projectile-project-root)))
         (template-file (expand-file-name "journal/scratch/templates/clojure.clj" (projectile-project-root))))
    (copy-file template-file
               scratch-file)
    (find-file scratch-file)))

(defun nextjournal/new-clojurescript-scratch-buffer (scratch-name)
  (interactive "sScratch file name: ")
  (let* ((scratch-file (expand-file-name (concat "journal/scratch/" scratch-name ".cljs")
                                         (projectile-project-root)))
         (template-file (expand-file-name "journal/scratch/templates/clojurescript.cljs" (projectile-project-root))))
    (copy-file template-file
               scratch-file)
    (find-file scratch-file)))

;; Allow nextjournal scratch buffers in journal/scratch to be found by projectfile-find-file
(setq projectile-indexing-method 'hybrid)
