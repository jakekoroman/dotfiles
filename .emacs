(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;;; Appearance and basic functionality
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "Iosevka 10" nil t)

;; Emacsclient stuff
(setq default-frame-scroll-bars nil)
(setq default-frame-alist '((font . "Iosevka-10" )))

(setq-default inhibit-tabs-mode nil)
(setq-default tab-width 4)
(setq
  inhibit-splash-screen t
  inhibit-startup-message t	
  scroll-step 3
  auto-save-default nil
  make-backup-files nil
  blink-cursor-mode nil
  ring-bell-function 'ignore
  display-line-numbers-type 'relative
  transient-mark-mode nil
  )
(global-display-line-numbers-mode)

;;; Package installs and configuration
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package quelpa :ensure)

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)
(setq use-package-ensure-function 'quelpa)

(use-package gruber-darker-theme
  :ensure)

(use-package zenburn-theme
  :ensure
  :config
  ;;(load-theme 'gruber-darker t)
  (load-theme 'tango-dark t)
  ;;(load-theme 'zenburn t)
  )

(use-package undo-fu
  :ensure)

(use-package evil
  :ensure
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure
  :init
  (evil-collection-init))

(use-package evil-multiedit
  :ensure
  :config
  ;; Sets the colour of the region
  (set-face-background 'iedit-occurrence "#d360d4")
  (evil-multiedit-default-keybinds))

(use-package smex
  :ensure
  :config
  (smex-initialize)
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands))

(use-package which-key
  :ensure
  :config
  (which-key-mode))

(use-package general
  :ensure
  :config
  (general-evil-setup t))

(use-package hl-todo
  :ensure
  :config
  (setq hl-todo-keyword-faces
	'(("TODO" . "#FF0000")))
  :init
  (global-hl-todo-mode))
  
(use-package magit :ensure)

(use-package lua-mode :ensure)

(use-package evil-commentary
  :ensure
  :config
  (evil-commentary-mode))

(use-package odin-mode
  :ensure
  :quelpa (odin-mode :fetcher github :repo "mattt-b/odin-mode")
  :config
  (require 'compile)
  (add-to-list 'compilation-error-regexp-alist '("\\(.+?\\)\(\\([0-9]+\\):\\([0-9]+\\\).*"
                                                 1 2 3)))

;;; Ido
(setq ido-enable-flex-matching t
      ido-everywhere t)
(ido-mode 1)

;;; C-mode
(setq c-default-style "linux"
      c-basic-offset 4)
(c-set-offset 'case-label '+)

(font-lock-add-keywords 'c-mode
			'(("internal" . font-lock-keyword-face)
			  ("global" . 'font-lock-keyword-face)))

;;; Keybinds

;; Binds with SPC prefix
(nvmap :keymaps 'override :prefix "SPC"
  "."   '(find-file :which-key "Find File")
  ","   '(ido-switch-buffer :which-key "Switch Buffer")
  "g g" '(magit :which-key "Magit")
  "o -" '(dired-jump :which-key "Open Dired here")

  ;; Compile Binds
  "c c" '(compile :which-key "Compile")
  "c C" '(recompile :which-key "Recompile")
  "c n" '(next-error :which-key "Goto next error")

  ;; Window Binds
  "w h" '(evil-window-left :which-key "Move left a window")
  "w l" '(evil-window-right :which-key "Move right a window")
  "w j" '(evil-window-down :which-key "Move down a window")
  "w k" '(evil-window-up :which-key "Move up a window")
  "w m" '(delete-other-windows :which-key "Maximize current window")
  "w n" '(evil-window-new :which-key "Open a new window")
  "w c" '(evil-window-delete :which-key "Close active window")
  "w s" '(evil-window-split :which-key "Split current window horizontally")
  "w v" '(evil-window-vsplit :which-key "Split current window vertically")

  ;; Buffer Binds
  "b p" '(previous-buffer :which-key "Open previous buffer")
  "b n" '(next-buffer :which-key "Open next buffer")
  )

;; Normal mode binds
(general-nmap
  "C-e" 'move-end-of-line)

;; Insert mode binds
(general-imap
  "C-y" 'evil-paste-after)

;; Binds without SPC prefix
(general-define-key
 "M-p" 'previous-error
 "M-n" 'next-error)