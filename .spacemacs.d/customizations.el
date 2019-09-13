
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-timeout 1)
 '(cider-allow-jack-in-without-project (quote warn))
 '(cider-edit-jack-in-command nil)
 '(cider-print-options (quote (("length" 100))))
 '(evil-cleverparens-swap-move-by-word-and-symbol t)
 '(evil-cleverparens-use-regular-insert nil)
 '(evil-cross-lines t)
 '(evil-move-beyond-eol t)
 '(evil-want-Y-yank-to-eol nil)
 '(helm-cider-overrides
   (quote
    ((cider-apropos . helm-cider-apropos)
     (cider-apropos-select . helm-cider-apropos)
     (cider-apropos-documentation . helm-cider-apropos-symbol-doc)
     (cider-apropos-documentation-select . helm-cider-apropos-symbol-doc)
     (cider-browse-ns-all . helm-cider-apropos-ns)
     (cider-browse-spec-all . helm-cider-spec))))
 '(org-agenda-files (quote ("~/Dropbox/makolet.org" "~/Dropbox/Goals.org")))
 '(org-catch-invisible-edits (quote error))
 '(org-image-actual-width 50)
 '(org-startup-truncated nil)
 '(org-todo-keywords (quote ((sequence "TODO" "INPROGRESS" "|" "DONE"))))
 '(package-selected-packages
   (quote
    (yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic lispyville lispy zoutline counsel swiper ivy rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby helm-clojuredocs ox-reveal emoji-cheat-sheet-plus company-emoji magit magit-gh-pulls gh marshal logito pcache ht magit-popup gitignore-mode transient yasnippet-snippets evil-cleverparens helm-cider kibit-helper flycheck-pos-tip pos-tip flycheck-clj-kondo yaml-mode ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pug-mode popwin persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file ob-elixir neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint launchctl json-mode js2-refactor js-doc indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy flycheck-mix flycheck-credo flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu emmet-mode elisp-slime-nav dumb-jump diminish diff-hl company-web company-statistics column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-compile alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(projectile-use-git-grep t)
 '(safe-local-variable-values
   (quote
    ((cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
