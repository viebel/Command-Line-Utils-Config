(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/")
	     t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;(add-hook 'after-init-hook #'global-flycheck-mode)


(setq package-enable-at-startup nil)
(setq package-check-signature nil)
(package-initialize)

;(global-set-key (kbd "M-[ D") 'paredit-forward-barf-sexp) ; inside tmux "ctrl-<left>" becomes "M-[ d"
;(global-set-key (kbd "C-<left>") 'paredit-forward-barf-sexp) ; inside tmux "ctrl-<left>" becomes "M-[ d"
;(global-set-key (kbd "C-<right>") 'paredit-forward-slurp-sexp) ; inside tmux "ctrl-<left>" becomes "M-[ d"
;(global-set-key (kbd "ESC [ 1 ; 5 D") 'paredit-forward-slurp-sexp) ; inside tmux "ctrl-<left>" becomes "M-[ d"
;(global-set-key (kbd "ESC O D [left-char]") 'paredit-forward-slurp-sexp) ; inside tmux "ctrl-<left>" becomes "M-[ d"


(add-hook 'clojure-mode-hook 'paredit-mode)

;(require 'flycheck-clj-kondo)

;(dolist (checker '(clj-kondo-clj clj-kondo-cljs clj-kondo-cljc clj-kondo-edn))
 ; (setq flycheck-checkers (cons checker (delq checker flycheck-checkers))))

;(dolist (checkers '((clj-kondo-clj . clojure-joker)
  ;                  (clj-kondo-cljs . clojurescript-joker)
    ;                (clj-kondo-cljc . clojure-joker)
     ;               (clj-kondo-edn . edn-joker)))
;  (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers))))





;; --- http://fgiasson.com/blog/index.php/2016/06/14/my-optimal-gnu-emacs-settings-for-developing-clojure-revised/ ---
;; Enter cider mode when entering the clojure major mode
					;(add-hook 'clojure-mode-hook 'cider-mode)
(setq cider-save-file-on-load t)


;; Turn on auto-completion with Company-Mode
(global-company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; Replace return key with newline-and-indent when in cider mode.
(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

;; Show parenthesis mode
(show-paren-mode 1)

;; rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Set theme & font size
;(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/monokai-theme")
;(load-theme 'monokai t)


;Update the color of the company-mode context menu to fit the Monokai theme
;@source: https://github.com/search?q=deftheme+company-tooltip&type=Code

;; (deftheme monokai-overrides)

;; (let ((class '((class color) (min-colors 257)))
;;       (terminal-class '((class color) (min-colors 89))))

;;   (custom-theme-set-faces
;;    'monokai-overrides

;;    ;; Linum and mode-line improvements (only in sRGB).
;;    `(linum
;;      ((,class :foreground "#75715E"
;; 	      :background "#49483E")))
;;    `(mode-line-inactive
;;      ((,class (:box (:line-width 1 :color "#2c2d26" :style nil)
;; 		    :background "#2c2d26"))))

;;    ;; Custom region colouring.
;;    `(region
;;      ((,class :foreground "#ffffff"
;; 	      :background "#000000")
;;       (,terminal-class :foreground "#1B1E1C"
;; 		       :background "#8B8878")))

;;    ;; Additional modes
;;    ;; Company tweaks.
;;    `(company-tooltip-common
;;      ((t :foreground "#F8F8F0"
;; 	 :background "#474747"
;; 	 :underline t)))

;;    `(company-template-field
;;      ((t :inherit company-tooltip
;; 	 :foreground "#C2A1FF")))

;;    `(company-tooltip-selection
;;      ((t :background "#349B8D"
;; 	 :foreground "#BBF7EF")))

;;    `(company-tooltip-common-selection
;;      ((t :foreground "#F8F8F0"
;; 	 :background "#474747"
;; 	 :underline t)))

;;    `(company-scrollbar-fg
;;      ((t :background "#BBF7EF")))

;;    `(company-tooltip-annotation
;;      ((t :inherit company-tooltip
;; 	 :foreground "#C2A1FF")))

;;    ;; Popup menu tweaks.
;;    `(popup-menu-face
;;      ((t :foreground "#A1EFE4"
;; 	 :background "#49483E")))

;;    `(popup-menu-selection-face
;;      ((t :background "#349B8D"
;; 	 :foreground "#BBF7EF")))

;;    ;; Circe
;;    `(circe-prompt-face
;;      ((t (:foreground "#C2A1FF" :weight bold))))

;;    `(circe-server-face
;;      ((t (:foreground "#75715E"))))

;;    `(circe-highlight-nick-face
;;      ((t (:foreground "#AE81FF" :weight bold))))

;;    `(circe-my-message-face
;;      ((t (:foreground "#E6DB74"))))

;;    `(circe-originator-face
;;           ((t (:weight bold))))))



;; --- end of http://fgiasson.com/blog/index.php/2016/06/14/my-optimal-gnu-emacs-settings-for-developing-clojure-revised/ --- 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(find-name-arg "-iname")
 '(package-selected-packages
   (quote
    (flycheck-clj-kondo kibit-helper helm-grepint xclip rainbow-mode rjsx-mode js2-mode helm helm-git-grep php-mode multiple-cursors clj-refactor cider markdown-mode command-log-mode clojure-mode rainbow-delimiters paredit company)))
 '(safe-local-variable-values
   (quote
    ((cider-refresh-after-fn . "com.nextjournal.journal.repl/post-refresh")
     (cider-refresh-before-fn . "com.nextjournal.journal.repl/pre-refresh")
     (cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "#F0B27A"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "magenta"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "#DAF7A6")))))

;cider cljs - see: https://github.com/Day8/re-frame-template
(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

;; see https://github.com/clojure-emacs/clj-refactor.el

(require 'clj-refactor)
(setq cljr-auto-clean-ns nil)
(setq cljr-warn-on-eval nil)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
(setq cljr-warn-on-eval nil)

;; https://github.com/yasuyk/helm-git-grep
(global-set-key (kbd "C-c g") 'helm-git-grep)

(global-set-key (kbd "C-x f") 'find-name-dired)

;; join line to next line
(global-set-key (kbd "C-l")
            (lambda ()
                  (interactive)
                  (join-line -1)))

;; reload buffers automatically
(global-auto-revert-mode t)


(require 'ido)
(ido-mode t)
