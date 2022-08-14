(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;;; Appearance and basic functionality
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "Iosevka 10" nil t)

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

(use-package gruber-darker-theme
  :ensure)

(use-package zenburn-theme
  :ensure
  :config
  (load-theme 'gruber-darker t)
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

;; Binds without SPC prefix
(general-define-key
 "M-n" 'next-error)
