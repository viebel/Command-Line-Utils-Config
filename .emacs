(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/")
	     t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(global-set-key (kbd "M-[ d") 'paredit-forward-barf-sexp) ; inside tmux "ctrl-<left>" becomes "M-[ d"
(global-set-key (kbd "M-[ c") 'paredit-forward-slurp-sexp) ; inside tmux "ctrl-<left>" becomes "M-[ d"


;; enter paredit mode when entering the clojure major mode
(add-hook 'clojure-mode-hook 'paredit-mode)
;; --- http://fgiasson.com/blog/index.php/2016/06/14/my-optimal-gnu-emacs-settings-for-developing-clojure-revised/ ---
;; Enter cider mode when entering the clojure major mode
(add-hook 'clojure-mode-hook 'cider-mode)


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

