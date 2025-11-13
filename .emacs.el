(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq user-mail-address "showell@umd.edu") ; set email address
(setq-default major-mode 'text-mode) ;
(show-paren-mode t) ; turn on highlight matching brackets when cursor is on one
(setq-default case-fold-search t ; case insensitive searches by default
              search-highlight t) ; hilit matches when searching
(global-hl-line-mode t) ; Highlight the line we are currently on

;; ;; Comment out if you've already loaded this package...
;; (require 'cl-lib)
;;
;; ;; Initialize package management
;; (require 'package)
;; (setq package-enable-at-startup nil)  ;; Prevents loading packages at startup
;; ;; add expanded package manager
;; (add-to-list 'package-archives '("melpa". "https://melpa.org/packages/") t) ;; Optional, adds MELPA repository
;; (package-initialize)
;;
;; (defvar my-packages
;;   '(auctex clojure-mode coffee-mode deft expand-region
;;                    gist groovy-mode haml-mode haskell-mode inf-ruby
;;                    magit markdown-mode paredit projectile python
;;                    sass-mode rainbow-mode scss-mode solarized-theme
;;                    volatile-highlights yaml-mode yari zenburn-theme)
;;   "A list of packages to ensure are installed at launch.")
;;
;; (defun my-packages-installed-p ()
;;   (cl-loop for p in my-packages
;;            when (not (package-installed-p p)) do (cl-return nil)
;;            finally (cl-return t)))
;;
;; (unless (my-packages-installed-p)
;;   ;; check for new packages (package versions)
;;   (package-refresh-contents)
;;   ;; install the missing packages
;;   (dolist (p my-packages)
;;     (when (not (package-installed-p p))
;;       (package-install p))))
;;
;; ;; Remove trailing white space upon saving
;; ;; Note: because of a bug in EIN we only delete trailing whitespace
;; ;; when not in EIN mode.
;; (add-hook 'before-save-hook
;;           (lambda ()
;;             (when (not (derived-mode-p 'ein:notebook-multilang-mode))
;;               (delete-trailing-whitespace))))
;;
;; ;; Auto-wrap at 80 characters
;; (setq-default auto-fill-function 'do-auto-fill)
;; (setq-default fill-column 80)
;; (turn-on-auto-fill)
;; ;; Disable auto-fill-mode in programming mode
;; (add-hook 'prog-mode-hook (lambda () (auto-fill-mode -1)))
;;
;; ;; We don't want to type yes and no all the time so, do y and n
;; (defalias 'yes-or-no-p 'y-or-n-p)
;;
;; ;; Disable the toolbar at the top since it's useless
;; (if (functionp 'tool-bar-mode) (tool-bar-mode -1))
;;
;; ;; Disable the menu bar since we don't use it, especially not in the
;; ;; terminal
;; (when (and (not (eq system-type 'darwin)) (fboundp 'menu-bar-mode))
;;   (menu-bar-mode -1))
;;
;; ;; Don't ring the bell
;; (setq ring-bell-function 'ignore)
;;
;; ;; Non-nil means draw block cursor as wide as the glyph under it.
;; ;; For example, if a block cursor is over a tab, it will be drawn as
;; ;; wide as that tab on the display.
;; (setq x-stretch-cursor t)
;;
;; ;; Dont ask to follow symlink in git
;; (setq vc-follow-symlinks t)
;;
;; ;; Check (on save) whether the file edited contains a shebang, if yes,
;; ;; make it executable from
;; ;; http://mbork.pl/2015-01-10_A_few_random_Emacs_tips
;; (add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)
;;
;; ;; Highlight some keywords in prog-mode
;; (add-hook 'prog-mode-hook
;;           (lambda ()
;;             ;; Highlighting in cmake-mode this way interferes with
;;             ;; cmake-font-lock, which is something I don't yet understand.
;;             (when (not (derived-mode-p 'cmake-mode))
;;               (font-lock-add-keywords
;;                nil
;;                '(("\\<\\(FIXME\\|TODO\\|BUG\\|DONE\\)"
;;                   1 font-lock-warning-face t))))
;;             )
;;           )
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Automatically compile and save ~/.emacs.el
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun byte-compile-init-files (file)
;;   "Automatically compile FILE."
;;   (interactive)
;;   (save-restriction
;;     ;; Suppress the warning when you setq an undefined variable.
;;     (if (>= emacs-major-version 23)
;;         (setq byte-compile-warnings '(not free-vars obsolete))
;;       (setq byte-compile-warnings
;;             '(unresolved
;;               callargs
;;               redefine
;;               obsolete
;;               noruntime
;;               cl-warnings
;;               interactive-only)))
;;     (byte-compile-file (expand-file-name file))
;;   )
;; )
;;
;; (add-hook
;;  'after-save-hook
;;  (function
;;   (lambda ()
;;     (if (string= (file-truename "~/.emacs.el")
;;                  (file-truename (buffer-file-name)))
;;         (byte-compile-init-files (file-truename "~/.emacs.el"))
;;     )
;;   )
;;  )
;; )
;;
;; ;; Byte-compile again to ~/.emacs.elc if it is outdated
;; (if (file-newer-than-file-p
;;      (file-truename "~/.emacs.el")
;;      (file-truename "~/.emacs.elc"))
;;     (byte-compile-init-files "~/.emacs.el"))
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Rainbow Delimiters -  have delimiters be colored by their depth
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package rainbow-delimiters
;;   :ensure t
;;   :init
;;   (eval-when-compile
;;     ;; Silence missing function warnings
;;     (declare-function rainbow-delimiters-mode "rainbow-delimiters.el"))
;;   (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Beacon-mode: flash the cursor when switching buffers or scrolling
;; ;;              the goal is to make it easy to find the cursor
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package beacon
;;   :ensure t
;;   :init
;;   (eval-when-compile
;;     ;; Silence missing function warnings
;;     (declare-function beacon-mode "beacon.el"))
;;   :config
;;   (beacon-mode t))
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Python mode settings
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq-default python-indent 4)
;; (setq-default python-indent-offset 4)
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (setq tab-width 4)))
;; (setq-default pdb-command-name "python -m pdb")
;; (use-package elpy
;;   :ensure t
;;   :commands (elpy-enable)
;;   :after python
;;   :config
;;   (elpy-enable)
;;   )
;;
;; (use-package yapfify
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'yapf-mode))
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Flyspell Mode for Spelling Corrections
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package flyspell
;;   :ensure t
;;   :init
;;   (eval-when-compile
;;     ;; Silence missing function warnings
;;     (declare-function flyspell-goto-next-error "flyspell.el")
;;     (declare-function flyspell-mode "flyspell.el")
;;     (declare-function flyspell-prog-mode "flyspell.el"))
;;   (setq flyspell-issue-welcome-flag nil)
;;   :config
;;   (defun flyspell-check-next-highlighted-word ()
;;     "Custom function to spell check next highlighted word."
;;     (interactive)
;;     (flyspell-goto-next-error)
;;     (ispell-word))
;;
;;   (global-set-key (kbd "<f7>") 'flyspell-buffer)
;;   (global-set-key (kbd "<f8>") 'flyspell-correct-previous)
;;   (global-set-key (kbd "<f9>") 'flyspell-correct-previous)
;;
;;   (add-hook 'text-mode-hook #'flyspell-mode)
;;   (add-hook 'prog-mode-hook #'flyspell-prog-mode)
;;   (add-hook 'org-mode-hook #'flyspell-mode)
;;   )
;; (use-package flyspell-correct-ivy
;;   :ensure t
;;   :after flyspell)
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Use markdown-mode for markdown files
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package markdown-mode
;;   :ensure t
;;   :mode (".md" ".markdown"))
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Appearance
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; The deeper blue theme is loaded but the resulting text
;; ;; appears black in Aquamacs. This can be fixed by setting
;; ;; the font color under Menu Bar->Options->Appearance->Font For...
;; ;; and then setting "Adopt Face and Frame Parameter as Frame Default"
;; (use-package sourcerer-theme
;;   :ensure t
;;   :config
;;   (load-theme 'sourcerer t))
;;
;; (set-face-background 'hl-line "#372E2D")
;; ;; The minibuffer default colors with my theme are impossible to read, so change
;; ;; them to something better using ivy-minibuffer-match-face.
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((((type tty) (background dark)) (:background "nil"))))
;;  '(company-preview ((t (:background "#073642" :foreground "#2aa198"))))
;;  '(company-preview-common ((t (:foreground "#93a1a1" :underline t))))
;;  '(company-scrollbar-bg ((t (:background "#073642" :foreground "#2aa198"))))
;;  '(company-scrollbar-fg ((t (:foreground "#002b36" :background "#839496"))))
;;  '(company-template-field ((t (:background "#7B6000" :foreground "#073642"))))
;;  '(company-tooltip ((t (:background "black" :foreground "DeepSkyBlue1"))))
;;  '(company-tooltip-annotation ((t (:foreground "#93a1a1" :background "#073642"))))
;;  '(company-tooltip-common ((t (:foreground "#93a1a1" :underline t))))
;;  '(company-tooltip-common-selection ((t (:foreground "#93a1a1" :underline t))))
;;  '(company-tooltip-mouse ((t (:background "DodgerBlue4" :foreground "CadetBlue1"))))
;;  '(company-tooltip-selection ((t (:background "DodgerBlue4" :foreground "CadetBlue1"))))
;;  '(header-line ((t (:background "#003366"))))
;;  '(ivy-minibuffer-match-face-1 ((((class color) (background light)) (:background "#555555")) (((class color) (background dark)) (:background "#555555"))))
;;  '(ivy-minibuffer-match-face-2 ((t (:background "#314f30" :weight bold))))
;;  '(ivy-minibuffer-match-face-3 ((t (:background "#48225b" :weight bold))))
;;  '(ivy-minibuffer-match-face-4 ((t (:background "#680a0a" :weight bold))))
;;  '(which-func ((t (:foreground "#8fb28f")))))
;;
;; ;; I don't care to see the splash screen
;; (setq inhibit-splash-screen t)
;;
;; ;; Hide the scroll bar
;; (scroll-bar-mode -1)
;; (defvar my-font-size 90)
;; ;; Make mode bar small
;; (set-face-attribute 'mode-line nil  :height my-font-size)
;; ;; Set the header bar font
;; (set-face-attribute 'header-line nil  :height my-font-size)
;; ;; Set default window size and position
;; (setq default-frame-alist
;;       '((top . 0) (left . 0) ;; position
;;         (width . 110) (height . 90) ;; size
;;         ))
;; ;; Enable line numbers on the LHS
;; (setq display-line-numbers 't)  ;; enable line numbers globally
;; ;; Set the font to size 9 (90/10).
;; (set-face-attribute 'default nil :height my-font-size)
;;
;; (setq-default indicate-empty-lines t)
;; (when (not indicate-empty-lines)
;;   (toggle-indicate-empty-lines))
;;
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Enable which function mode and set the header line to display both the
;; ;; path and the function we're in
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (which-function-mode t)
;;
;; ;; Remove function from mode bar
;; (setq mode-line-misc-info
;;       (delete (assoc 'which-func-mode
;;                      mode-line-misc-info) mode-line-misc-info))
;;
;;
;; (defmacro with-face
;;     (str &rest properties)
;;   `(propertize ,str 'face (list ,@properties)))
;;
;; (defun sl/make-header ()
;;   "."
;;   (let* ((sl/full-header (abbreviate-file-name buffer-file-name))
;;          (sl/header (file-name-directory sl/full-header))
;;          (sl/drop-str "[...]")
;;          )
;;     (if (> (length sl/full-header)
;;            (window-body-width))
;;         (if (> (length sl/header)
;;                (window-body-width))
;;             (progn
;;               (concat (with-face sl/drop-str
;;                                  :background "blue"
;;                                  :weight 'bold
;;                                  )
;;                       (with-face (substring sl/header
;;                                             (+ (- (length sl/header)
;;                                                   (window-body-width))
;;                                                (length sl/drop-str))
;;                                             (length sl/header))
;;                                  ;; :background "red"
;;                                  :weight 'bold
;;                                  )))
;;           (concat
;;            (with-face sl/header
;;                       ;; :background "red"
;;                       :foreground "red"
;;                       :weight 'bold)))
;;       (concat (if window-system ;; In the terminal the green is hard to read
;;                   (with-face sl/header
;;                              ;; :background "green"
;;                              ;; :foreground "black"
;;                              :weight 'bold
;;                              :foreground "#8fb28f"
;;                              )
;;                 (with-face sl/header
;;                            ;; :background "green"
;;                            ;; :foreground "black"
;;                            :weight 'bold
;;                            :foreground "blue"
;;                            ))
;;               (with-face (file-name-nondirectory buffer-file-name)
;;                          :weight 'bold
;;                          ;; :background "red"
;;                          )))))
;;
;; (defun sl/display-header ()
;;   "Create the header string and display it."
;;   ;; The dark blue in the header for which-func is terrible to read.
;;   ;; However, in the terminal it's quite nice
;;   (if window-system
;;       (custom-set-faces
;;        '(which-func ((t (:foreground "#8fb28f")))))
;;     (custom-set-faces
;;      '(which-func ((t (:foreground "blue"))))))
;;   ;; Set the header line
;;   (setq header-line-format
;;
;;         (list "-"
;;               '(which-func-mode ("" which-func-format))
;;               '("" ;; invocation-name
;;                 (:eval (if (buffer-file-name)
;;                            (concat "[" (sl/make-header) "]")
;;                          "[%b]")))
;;               )
;;         )
;;   )
;; ;; Call the header line update
;; (add-hook 'buffer-list-update-hook
;;           'sl/display-header)
;; ;; removed powerline-right-theme
;; ;; perhaps go back to this to revisit: https://github.com/nilsdeppe/MyEnvironment
;;
;; (provide '.emacs)
;; ;;; .emacs ends here
;;
;; ;; https://gist.github.com/nilsdeppe/7645c096d93b005458d97d6874a91ea9
