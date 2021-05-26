;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     sql
     asciidoc
     (plantuml :variables plantuml-jar-path "~/bin/plantUml.jar")
     javascript
     (spell-checking :variables spell-checking-enable-auto-dictionary t)
     (org :variables
          org-enable-org-journal-support t
          org-journal-dir "~/Dropbox/journal/")
     html
     (clojure :variables
              clojure-backend 'cider
              clojure-enable-linters 'clj-kondo
              clojure-enable-fancify-symbols nil)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     themes-megapack ;; here is the theme gallery https://themegallery.robdor.com/
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     ;; To have auto-completion on as soon as you start typing
     ;; (auto-completion :variables [auto-completion-idle-delay]) nil
     ;; better-defaults
     emacs-lisp
     git
     github
     osx
     emoji
     markdown
     ;;multiple-cursors
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     (spell-checking :variables
                     enable-flyspell-auto-completion nil)
     syntax-checking
     version-control
     yaml
     search-engine
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(kibit-helper
                                      org-journal
                                      walkclj
                                      helm-clojuredocs
                                      graphql-mode
                                      evil-string-inflection
                                      cider
                                      helm-cider
                                      yasnippet-snippets)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-search-highlight-persist
                                    company-tern
                                    ;;magithub
                                    )

   dotspacemacs-auto-save-file-location 'cache
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls (them.
   ;; default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 20

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'clojure-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%b"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  ;; Enable structural editing for all Clojure buffers
  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-clojure-mode)

  ;; mode line time stamp
  (setq display-time-24hr-format t)
  (setq display-time-format "%H:%M")        ; add seconds
  (setq display-time-interval 10)               ; update every second
  (setq display-time-default-load-average nil) ; don't show load average
  (setq display-time-mail-string "")           ; don't show mail
  (display-time-mode 1)                 ; show time in mode line on startup

  ;; Set tab width for HTML/CSS/JS modes
  (setq default-indent 2)
  (setq web-mode-markup-indent-offset default-indent) ;; HTML in .html
  (setq web-mode-css-indent-offset default-indent)    ;; CSS in .html
  (setq css-indent-offset default-indent)             ;; CSS in .css
  (setq web-mode-code-indent-offset default-indent)   ;; JS in .html
  (setq javascript-indent-level default-indent)       ;; JS in .js

  ;; disable mouse interaction
  (xterm-mouse-mode 0)
  (spacemacs/toggle-highlight-current-line-globally-off)
  ;; Don't warn for missing semicolons in javascript files
  (setq js2-mode-show-strict-warnings nil)

  ;; line-wise resizing leaves gaps on top and bottom when maximized
  (setq frame-resize-pixelwise t)

  ;; disable cider help banner
  (setq cider-repl-display-help-banner nil)

  ;; auto save files when invoking magit status without asking
  (setq magit-save-repository-buffers 'dontask)

  ;; better magit colors for emacs in terminal
  (custom-set-faces
   '(magit-diff-added ((((type tty)) (:foreground "green"))))
   '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
   '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
   '(magit-diff-file-heading ((((type tty)) nil)))
   '(magit-diff-removed ((((type tty)) (:foreground "red"))))
   '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
   '(magit-section-highlight ((((type tty)) nil))))

  ;; allow to move beyond the end of line - it is crucial for structural navigation
  (setq evil-move-beyond-eol t)


  ;; https://github.com/syl20bnr/spacemacs/issues/2222#issuecomment-481155006
  (cond
   ;; OS X
   ((string-equal system-type "darwin") ; Mac OS X
    (progn
      (setq save-to-clipboard-cmd "pbcopy")
      (setq paste-from-clipboard-cmd "pbpaste")
      )
    )
   ;; Linux
   ((string-equal system-type "gnu/linux") ; linux
    (progn
      (setq save-to-clipboard-cmd "xsel -i -b")
      (setq paste-from-clipboard-cmd "xsel -o -b")
      )
    )
   )

  (defun copy-to-clipboard ()
    "Copies selection to x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (message "Yanked region to x-clipboard!")
          (call-interactively 'clipboard-kill-ring-save)
          )
      (if (region-active-p)
          (progn
            (shell-command-on-region (region-beginning) (region-end) save-to-clipboard-cmd)
            (message "Yanked region to clipboard!")
            (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))
    )

  (defun paste-from-clipboard ()
    "Pastes from x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (clipboard-yank)
          (message "graphics active")
          )
      (insert (shell-command-to-string paste-from-clipboard-cmd))
      )
    )
  (evil-leader/set-key "o y" 'copy-to-clipboard)
  (evil-leader/set-key "o p" 'paste-from-clipboard)

  (require 'windmove)
  (windmove-default-keybindings 'super)

  ;; automatically save buffers associated with files on buffer switch
  ;; and on windows switch
  (defadvice switch-to-buffer (before save-buffer-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice other-window (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice windmove-up (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice windmove-down (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice windmove-left (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice windmove-right (before other-window-now activate)
    (when buffer-file-name (save-buffer)))

  ;; Solves Symbol Highlight Transient state see https://github.com/syl20bnr/spacemacs/issues/10186
  (defun solve-symbol-highlight ()
    (setq ahs-include "^\\_<\\(?:\\s_\\|\\sw\\)+\\_>$"))

  (add-hook 'clojure-mode-hook #'solve-symbol-highlight)

  ;; Reduce line number gutter witespace for small files
  (setq display-line-numbers-width-start t)

  ;; no warning for cljr before eval
  (setq cljr-warn-on-eval nil)


  ;; disable arrows when they are superfluous
  (define-key evil-insert-state-map (kbd "<left>") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "<left>") 'evil-window-left)
  (define-key evil-insert-state-map (kbd "<right>") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "<right>") 'evil-window-right)
  (define-key evil-insert-state-map (kbd "<down>") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "<down>") 'evil-window-down)
  (define-key evil-insert-state-map (kbd "<up>") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "<up>") 'evil-window-up)

  ;; insert a single character in normal mode
  ;; thank you https://emacs.stackexchange.com/a/33991
  (defun my/insert-char (char count)
    (interactive "c\np")
    (insert-char char count))

  (spacemacs/set-leader-keys (kbd "ii") 'my/insert-char)

  ;; open calendar
  (spacemacs/set-leader-keys (kbd "at") 'calendar)

  ;; allow delete char backward in isert mode
  (define-key evil-insert-state-map (kbd "C-d") 'evil-delete-backward-char)

  (spacemacs/set-leader-keys "ps" 'projectile-run-shell)
  ;; toggle neotree with "ot"
  (spacemacs/set-leader-keys "ot" 'neotree-toggle)

  (with-eval-after-load 'ox
    ;; export timestamp in a clean way. See https://endlessparentheses.com/better-time-stamps-in-org-export.html
    (add-to-list 'org-export-filter-timestamp-functions
                 #'endless/filter-timestamp)

    (defun endless/filter-timestamp (trans back _comm)
      "Remove <> around time-stamps."
      (pcase back
        ((or `jekyll `html)
         (replace-regexp-in-string "&[lg]t;" "" trans))
        (`latex
         (replace-regexp-in-string "[<>]" "" trans))))

  ;;; Activate custom format only during export. See https://emacs.stackexchange.com/a/34436
    (setq org-time-stamp-custom-formats
          '("<%d %b %Y>" . "<%d/%m/%y %a %H:%M>"))
    (defun my-org-export-ensure-custom-times (backend)
      (setq-local org-display-custom-times t))
    (add-hook 'org-export-before-processing-hook 'my-org-export-ensure-custom-times))


  ;; org mode leader keys
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "A" 'org-show-all)


  ;; org mode key bindings to use special arrows with hjkl in normal mode
  (with-eval-after-load 'org
    (evil-define-key 'normal org-mode-map (kbd "H") 'org-shiftleft)
    (evil-define-key 'normal org-mode-map (kbd "J") 'org-shiftdown)
    (evil-define-key 'normal org-mode-map (kbd "K") 'org-shiftup)
    (evil-define-key 'normal org-mode-map (kbd "L") 'org-shiftright)
    )

  ;; See https://github.com/LonoCloud/evil/blob/master/evil-integration.el for more tricks about evit integration
  ;; calendar mode bindings
  (with-eval-after-load 'calendar
    (defvar calendar-mode-map)
    (evil-make-overriding-map calendar-mode-map)
    (evil-define-key nil calendar-mode-map
      "j" 'evil-next-line
      "k" 'evil-previous-line
      "J" 'org-journal-read-entry)
    )

  ;; additional keys for clojure code evaluation
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "\"" 'cider-jack-in-cljs)
  (spacemacs/set-leader-keys-for-major-mode 'clojurec-mode "\"" 'cider-jack-in-cljs)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "\"" 'cider-jack-in-cljs)
  (spacemacs/declare-prefix-for-mode 'clojure-mode "mc" "comments")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "cf" 'cider-pprint-eval-defun-to-comment)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "ce" 'cider-pprint-eval-last-sexp-to-comment)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "cE" 'cider-pprint-eval-last-sexp-to-repl)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "dr" 'cider-inspect-last-result)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "gm" 'helm-imenu)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "hc" (lambda ()
                                                                 (interactive)
                                                                 (cider-browse-ns (cider-current-ns))))

  ;; additional keys for org mode
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "tky" 'org-table-copy-region)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "tkp" 'org-table-paste-rectangle)

  ;; Enable aggressive indent mode for Clojure
  (add-hook 'clojure-mode-hook (lambda ()
                                 (helm-cider-mode)
                                 (spacemacs/toggle-syntax-checking-on)
                                        ; (spacemacs/toggle-aggressive-indent-on)
                                 ))

  ;;(eval-after-load 'cider
  ;; #'emidje-setup)

  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "tma" 'emidje-run-all-tests)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "tmb" 'emidje-show-test-report)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "tmn" 'emidje-run-ns-tests)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "tmr" 'emidje-re-run-non-passing-tests)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "tmt" 'emidje-run-test-at-point)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "tmi" 'emidje-format-tabular)

  ;; See https://github.com/luxbock/evil-cleverparens/issues/58#issuecomment-717419683
  (use-package evil-cleverparens
    :init
    (setq evil-cleverparens-use-additional-bindings nil)
    :config
    (setq evil-cleverparens-use-additional-bindings t)
    (unless window-system
      (setq evil-cp-additional-bindings (assoc-delete-all "M-[" evil-cp-additional-bindings))
      (setq evil-cp-additional-bindings (assoc-delete-all "M-]" evil-cp-additional-bindings)))
    (evil-cp-set-additional-bindings))

  ;; Set to nil if stdout in repl impacts Emacs performance
  (setq cider-redirect-server-output-to-repl t)

  ;; disable automatic adding of requires as this can have considerable perofrmance issues
  (setq cljr-magic-requires nil)

  ;; prevent long eval times the first time a cljs form is evaled
  (setq cider-auto-track-ns-form-changes nil)

  ;; consider forms in comment forms top level
  (setq clojure-toplevel-inside-comment-form t)

  ;; Custom Clojure formatting
  (with-eval-after-load 'clojure-mode
    (define-clojure-indent
      (match 1)))

  ;; Set cider repl buffers to normal initially
  (evil-set-initial-state 'cider-repl-mode 'normal)

  ;; Save all files when switching from Emacs to another app
  (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

  ;; auto save activated for all files
  (add-hook 'text-mode-hook 'auto-save-visited-mode)
  (add-hook 'prog-mode-hook 'auto-save-visited-mode)

  ;; use dictionary for auto completion
  (defun my/use-dict-for-autocompletion ()
    (interactive)
    (set (make-local-variable 'company-backends) '(company-ispell)))

  (add-hook 'org-mode-hook 'my/use-dict-for-autocompletion)
  (spacemacs/set-leader-keys (kbd "aw") 'my/use-dict-for-autocompletion)

  ;; Additional Clojure key bindings
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode
               cider-repl-mode
               cider-clojure-interaction-mode))
    (spacemacs/set-leader-keys-for-major-mode m
      "en" 'cider-eval-ns-form
      "ff" 'cider-format-defun
      "fr" 'cider-format-region))

  ;;when running the following code to disable c-z bindings it causes lots of troubles
  ;; (with-eval-after-load 'evil
  ;; (define-key evil-emacs-state-map (kbd "C-z") nil)
  ;; (define-key evil-normal-state-map (kbd "C-z") nil))

  (with-eval-after-load 'projectile
    (projectile-register-project-type
     'clojure-tools-deps '("deps.edn")
     :test-suffix "_test"))

  (when (file-exists-p "~/.spacemacs.d/nextjournal.el")
    (load "~/.spacemacs.d/nextjournal.el"))

  (when (file-exists-p "~/.spacemacs.d/clj-ns-name.el")
    (load "~/.spacemacs.d/clj-ns-name.el")
    (clj-ns-name-install))

  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.
  (defun dotspacemacs/emacs-custom-settings ()
    "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
    (custom-set-variables
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(package-selected-packages
       (quote
        (cider yasnippet-snippets yaml-mode ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit symon string-inflection spaceline-all-the-icons smeargle slim-mode sesman scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters queue pug-mode prettier-js popwin persp-mode pcre2el password-generator paradox overseer osx-trash osx-dictionary orgit org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-elixir neotree nameless move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode link-hint launchctl json-navigator json-mode js2-refactor js-doc indent-guide impatient-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy font-lock+ flycheck-mix flycheck-credo flycheck-clj-kondo flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-cleverparens evil-args evil-anzu emmet-mode elisp-slime-nav editorconfig dumb-jump dracula-theme dotenv-mode diminish diff-hl counsel-projectile company-web company-statistics column-enforce-mode clojure-snippets clojure-cheatsheet clj-refactor clean-aindent-mode cider-eval-sexp-fu centered-cursor-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-compile alchemist aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell)))
     '(safe-local-variable-values
       (quote
        ((cider-refresh-after-fn . "com.nextjournal.journal.repl/post-refresh")
         (cider-refresh-before-fn . "com.nextjournal.journal.repl/pre-refresh")
         ;;     (javascript-backend . tern)
         (javascript-backend . lsp)
         (elixir-enable-compilation-checking . t)
         (elixir-enable-compilation-checking)))))
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     )
    ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-timeout 1)
 '(auto-save-visited-interval 2)
 '(cider-allow-jack-in-without-project 'warn)
 '(cider-edit-jack-in-command nil)
 '(cider-ns-refresh-after-fn "user/start")
 '(cider-ns-refresh-before-fn "user/stop")
 '(cider-print-options '(("length" 100)))
 '(cider-save-file-on-load t)
 '(cljr-auto-clean-ns nil)
 '(cljr-auto-sort-ns nil)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#7ec98f")
 '(cua-normal-cursor-color "#7b7b7b")
 '(cua-overwrite-cursor-color "#e5c06d")
 '(cua-read-only-cursor-color "#8ac6f2")
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(diary-file "~/Dropbox/diary/diary.org")
 '(doom-modeline-buffer-encoding nil)
 '(doom-modeline-enable-word-count t)
 '(emidje-always-show-test-report t)
 '(emidje-show-full-test-summary t)
 '(emms-mode-line-icon-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };"))
 '(evil-cleverparens-swap-move-by-word-and-symbol t)
 '(evil-cleverparens-use-regular-insert nil)
 '(evil-cross-lines t)
 '(evil-move-beyond-eol t)
 '(evil-want-Y-yank-to-eol nil)
 '(fringe-mode 6 nil (fringe))
 '(gnus-logo-colors '("#528d8d" "#c0c0c0") t)
 '(gnus-mode-line-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };") t)
 '(helm-buffer-max-length 100)
 '(helm-cider-overrides
   '((cider-apropos . helm-cider-apropos)
     (cider-apropos-select . helm-cider-apropos)
     (cider-apropos-documentation . helm-cider-apropos-symbol-doc)
     (cider-apropos-documentation-select . helm-cider-apropos-symbol-doc)
     (cider-browse-ns-all . helm-cider-apropos-ns)
     (cider-browse-spec-all . helm-cider-spec)))
 '(helm-completion-style 'emacs)
 '(helm-grep-ignored-directories
   '("SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "dist/"))
 '(highlight-changes-colors '("#e5786d" "#834c98"))
 '(highlight-symbol-colors
   '("#37d8363d134e" "#191c36983654" "#37d8363d134e" "#37e2157b36a3" "#191c36983654" "#37d8363d134e" "#191c36983654"))
 '(highlight-symbol-foreground-color "#8b8b8b")
 '(highlight-tail-colors
   '(("#0a0a0a" . 0)
     ("#162c2c" . 20)
     ("#162c2c" . 30)
     ("#162c2c" . 50)
     ("#2d2c11" . 60)
     ("#2d2c11" . 70)
     ("#2d2c11" . 85)
     ("#0a0a0a" . 100)))
 '(hl-bg-colors
   '("#2d2c11" "#2d2c11" "#2d2c11" "#2d2c11" "#2d132c" "#162c2c" "#162c2c" "#162c2c"))
 '(hl-fg-colors
   '("#000000" "#000000" "#000000" "#000000" "#000000" "#000000" "#000000" "#000000"))
 '(ispell-silently-savep t)
 '(linum-format " %7i ")
 '(lsp-ui-doc-border "#8b8b8b")
 '(nrepl-message-colors
   '("#ffb4ac" "#ddaa6f" "#e5c06d" "#162c2c" "#dffaf9" "#162c2c" "#7ec98f" "#e5786d" "#834c98"))
 '(org-agenda-files
   '("~/Dropbox/TODOS/company.org" "~/Dropbox/TODOS/kids.org" "~/Dropbox/TODOS/scale my business.org" "~/Dropbox/TODOS/Focusing.org" "~/Dropbox/TODOS/Consulting hours.org" "~/Dropbox/TODOS/TODOS.org" "~/Dropbox/journal/20190101" "~/Dropbox/diary/diary.org" "~/Dropbox/TODOS/coaching.org" "~/prj/cyco/mr-hankey-2/TODOS.org" "~/Dropbox/TODOS/makolet.org" "~/Dropbox/TODOS/goals.org" "~/Dropbox/TODOS/programmer.org"))
 '(org-agenda-include-diary t)
 '(org-agenda-start-on-weekday 0)
 '(org-catch-invisible-edits 'error)
 '(org-image-actual-width '(500))
 '(org-journal-file-type 'yearly)
 '(org-startup-truncated nil)
 '(org-todo-keywords '((sequence "TODO" "INPROGRESS" "|" "DONE")))
 '(package-selected-packages
   '(csv-mode engine-mode define-word tern json-snatcher json-reformat parent-mode edn peg haml-mode fringe-helper git-gutter+ s web-completion-data inflections spinner queue pkg-info parseclj a epl bind-map packed auto-complete sql-indent plantuml-mode string-inflection evil-string-inflection anzu iedit popup adoc-mode markup-faces walkclj treepy all-the-icons doom-modeline discover-clj-refactor zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme emidje graphql-mode evil goto-chg powerline hydra lv bind-key avy eval-sexp-fu company paredit smartparens highlight undo-tree flycheck git-gutter cider sesman parseedn clojure-mode flx request helm helm-core dash-functional yasnippet multiple-cursors skewer-mode js2-mode simple-httpd git-commit with-editor async markdown-mode projectile org-plus-contrib f dash terminal-focus-reporting flyspell-popup flyspell-correct-helm flyspell-correct auto-dictionary company-quickhelp org-journal org-category-capture alert log4e gntp yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic lispyville lispy zoutline counsel swiper ivy rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby helm-clojuredocs ox-reveal emoji-cheat-sheet-plus company-emoji magit-gh-pulls gh marshal logito pcache ht magit-popup gitignore-mode transient yasnippet-snippets evil-cleverparens helm-cider kibit-helper flycheck-pos-tip pos-tip flycheck-clj-kondo yaml-mode ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pug-mode popwin persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file ob-elixir neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint launchctl json-mode js2-refactor js-doc indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy flycheck-mix flycheck-credo flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu emmet-mode elisp-slime-nav dumb-jump diminish diff-hl company-web company-statistics column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-compile alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))
 '(plantuml-default-exec-mode 'jar)
 '(plantuml-indent-level 2)
 '(pos-tip-background-color "#0a0a0a")
 '(pos-tip-foreground-color "#8b8b8b")
 '(projectile-globally-ignored-directories
   '(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".clj-kondo"))
 '(projectile-use-git-grep t)
 '(safe-local-variable-values
   '((cider-shadow-cljs-default-options . "app")
     (cider-preferred-build-tool . "lein")
     (org-image-actual-width)
     (cider-ns-refresh-after-fn . "user/start")
     (cider-ns-refresh-before-fn . "user/stop")))
 '(search-default-mode 'char-fold-to-regexp)
 '(search-highlight t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#8ac6f2" "#0a0a0a" 0.2))
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#7b7b7b")
 '(vc-annotate-background "#1f2124")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#ff0000")
     (40 . "#ff4a52")
     (60 . "#f6aa11")
     (80 . "#f1e94b")
     (100 . "#f5f080")
     (120 . "#f6f080")
     (140 . "#41a83e")
     (160 . "#40b83e")
     (180 . "#b6d877")
     (200 . "#b7d877")
     (220 . "#b8d977")
     (240 . "#b9d977")
     (260 . "#93e0e3")
     (280 . "#72aaca")
     (300 . "#8996a8")
     (320 . "#afc4db")
     (340 . "#cfe2f2")
     (360 . "#dc8cc3")))
 '(vc-annotate-very-old-color "#dc8cc3")
 '(weechat-color-list
   '(unspecified "#000000" "#0a0a0a" "#2d2c11" "#ffb4ac" "#162c2c" "#8ac6f2" "#2d2c11" "#e5c06d" "#162c2c" "#a4b5e6" "#2d2c11" "#e5786d" "#162c2c" "#7ec98f" "#7b7b7b" "#5e5e5e"))
 '(xterm-color-names
   ["#0a0a0a" "#ffb4ac" "#8ac6f2" "#e5c06d" "#a4b5e6" "#e5786d" "#7ec98f" "#ededed"])
 '(xterm-color-names-bright
   ["#000000" "#ddaa6f" "#525252" "#5e5e5e" "#7b7b7b" "#834c98" "#8b8b8b" "#fffeff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-preview ((t (:background "blue4" :foreground "white"))))
 '(company-scrollbar-bg ((t (:background "magenta"))))
 '(company-tooltip ((t (:foreground "cyan"))))
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-hash ((t (:foreground "green"))))
 '(magit-section-highlight ((((type tty)) nil)))
 '(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
 '(term-color-blue ((t (:foreground "#7CB8BB" :background "#4C7073"))))
 '(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
 '(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
 '(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
 '(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
 '(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))
 '(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-white)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-timeout 1)
 '(auto-save-visited-interval 2)
 '(cider-allow-jack-in-without-project 'warn)
 '(cider-edit-jack-in-command nil)
 '(cider-ns-refresh-after-fn "user/start")
 '(cider-ns-refresh-before-fn "user/stop")
 '(cider-print-options '(("length" 100)))
 '(cider-save-file-on-load t)
 '(cljr-auto-clean-ns nil)
 '(cljr-auto-sort-ns nil)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#7ec98f")
 '(cua-normal-cursor-color "#7b7b7b")
 '(cua-overwrite-cursor-color "#e5c06d")
 '(cua-read-only-cursor-color "#8ac6f2")
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(diary-file "~/Dropbox/diary/diary.org")
 '(doom-modeline-buffer-encoding nil)
 '(doom-modeline-enable-word-count t)
 '(emidje-always-show-test-report t)
 '(emidje-show-full-test-summary t)
 '(emms-mode-line-icon-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };"))
 '(evil-cleverparens-swap-move-by-word-and-symbol t)
 '(evil-cleverparens-use-regular-insert nil)
 '(evil-cross-lines t)
 '(evil-move-beyond-eol t)
 '(evil-want-Y-yank-to-eol nil)
 '(fringe-mode 6 nil (fringe))
 '(gnus-logo-colors '("#528d8d" "#c0c0c0") t)
 '(gnus-mode-line-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };") t)
 '(helm-buffer-max-length 100)
 '(helm-cider-overrides
   '((cider-apropos . helm-cider-apropos)
     (cider-apropos-select . helm-cider-apropos)
     (cider-apropos-documentation . helm-cider-apropos-symbol-doc)
     (cider-apropos-documentation-select . helm-cider-apropos-symbol-doc)
     (cider-browse-ns-all . helm-cider-apropos-ns)
     (cider-browse-spec-all . helm-cider-spec)))
 '(helm-completion-style 'emacs)
 '(helm-grep-ignored-directories
   '("SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "dist/"))
 '(highlight-changes-colors '("#e5786d" "#834c98"))
 '(highlight-symbol-colors
   '("#37d8363d134e" "#191c36983654" "#37d8363d134e" "#37e2157b36a3" "#191c36983654" "#37d8363d134e" "#191c36983654"))
 '(highlight-symbol-foreground-color "#8b8b8b")
 '(highlight-tail-colors
   '(("#0a0a0a" . 0)
     ("#162c2c" . 20)
     ("#162c2c" . 30)
     ("#162c2c" . 50)
     ("#2d2c11" . 60)
     ("#2d2c11" . 70)
     ("#2d2c11" . 85)
     ("#0a0a0a" . 100)))
 '(hl-bg-colors
   '("#2d2c11" "#2d2c11" "#2d2c11" "#2d2c11" "#2d132c" "#162c2c" "#162c2c" "#162c2c"))
 '(hl-fg-colors
   '("#000000" "#000000" "#000000" "#000000" "#000000" "#000000" "#000000" "#000000"))
 '(ispell-silently-savep t)
 '(linum-format " %7i ")
 '(lsp-ui-doc-border "#8b8b8b")
 '(nrepl-message-colors
   '("#ffb4ac" "#ddaa6f" "#e5c06d" "#162c2c" "#dffaf9" "#162c2c" "#7ec98f" "#e5786d" "#834c98"))
 '(org-agenda-files
   '("~/Dropbox/TODOS/company.org" "~/Dropbox/TODOS/kids.org" "~/Dropbox/TODOS/scale my business.org" "~/Dropbox/TODOS/Focusing.org" "~/Dropbox/TODOS/Consulting hours.org" "~/Dropbox/TODOS/TODOS.org" "~/Dropbox/journal/20190101" "~/Dropbox/diary/diary.org" "~/Dropbox/TODOS/coaching.org" "~/prj/cyco/mr-hankey-2/TODOS.org" "~/Dropbox/TODOS/makolet.org" "~/Dropbox/TODOS/goals.org" "~/Dropbox/TODOS/programmer.org"))
 '(org-agenda-include-diary t)
 '(org-agenda-start-on-weekday 0)
 '(org-catch-invisible-edits 'error)
 '(org-image-actual-width '(500) t)
 '(org-journal-file-type 'yearly)
 '(org-startup-truncated nil)
 '(org-todo-keywords '((sequence "TODO" "INPROGRESS" "|" "DONE")))
 '(package-selected-packages
   '(cider yasnippet-snippets yaml-mode ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit symon string-inflection spaceline-all-the-icons smeargle slim-mode sesman scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters queue pug-mode prettier-js popwin persp-mode pcre2el password-generator paradox overseer osx-trash osx-dictionary org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-elixir neotree nameless move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode link-hint launchctl json-navigator json-mode js2-refactor js-doc indent-guide impatient-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy font-lock+ flycheck-mix flycheck-credo flycheck-clj-kondo flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-cleverparens evil-args evil-anzu emmet-mode elisp-slime-nav editorconfig dumb-jump dracula-theme dotenv-mode diminish diff-hl counsel-projectile company-web company-statistics column-enforce-mode clojure-snippets clojure-cheatsheet clj-refactor clean-aindent-mode cider-eval-sexp-fu centered-cursor-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-compile alchemist aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell))
 '(plantuml-default-exec-mode 'jar)
 '(plantuml-indent-level 2)
 '(pos-tip-background-color "#0a0a0a")
 '(pos-tip-foreground-color "#8b8b8b")
 '(projectile-globally-ignored-directories
   '(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".clj-kondo"))
 '(projectile-use-git-grep t)
 '(safe-local-variable-values
   '((cider-refresh-after-fn . "com.nextjournal.journal.repl/post-refresh")
     (cider-refresh-before-fn . "com.nextjournal.journal.repl/pre-refresh")
     (javascript-backend . lsp)
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking)))
 '(search-default-mode 'char-fold-to-regexp)
 '(search-highlight t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#8ac6f2" "#0a0a0a" 0.2))
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#7b7b7b")
 '(vc-annotate-background "#1f2124")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#ff0000")
     (40 . "#ff4a52")
     (60 . "#f6aa11")
     (80 . "#f1e94b")
     (100 . "#f5f080")
     (120 . "#f6f080")
     (140 . "#41a83e")
     (160 . "#40b83e")
     (180 . "#b6d877")
     (200 . "#b7d877")
     (220 . "#b8d977")
     (240 . "#b9d977")
     (260 . "#93e0e3")
     (280 . "#72aaca")
     (300 . "#8996a8")
     (320 . "#afc4db")
     (340 . "#cfe2f2")
     (360 . "#dc8cc3")))
 '(vc-annotate-very-old-color "#dc8cc3")
 '(weechat-color-list
   '(unspecified "#000000" "#0a0a0a" "#2d2c11" "#ffb4ac" "#162c2c" "#8ac6f2" "#2d2c11" "#e5c06d" "#162c2c" "#a4b5e6" "#2d2c11" "#e5786d" "#162c2c" "#7ec98f" "#7b7b7b" "#5e5e5e"))
 '(xterm-color-names
   ["#0a0a0a" "#ffb4ac" "#8ac6f2" "#e5c06d" "#a4b5e6" "#e5786d" "#7ec98f" "#ededed"])
 '(xterm-color-names-bright
   ["#000000" "#ddaa6f" "#525252" "#5e5e5e" "#7b7b7b" "#834c98" "#8b8b8b" "#fffeff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-preview ((t (:background "blue4" :foreground "white"))))
 '(company-scrollbar-bg ((t (:background "magenta"))))
 '(company-tooltip ((t (:foreground "cyan"))))
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-hash ((t (:foreground "green"))))
 '(magit-section-highlight ((((type tty)) nil)))
 '(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
 '(term-color-blue ((t (:foreground "#7CB8BB" :background "#4C7073"))))
 '(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
 '(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
 '(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
 '(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
 '(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))
 '(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-white)))))
)
