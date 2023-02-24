(setq custom-file (concat user-emacs-directory "custom.el"))
(add-to-list 'load-path "~/.emacs.local")
(add-to-list 'custom-theme-load-path "~/.emacs.local")
(load "odin-mode")
(when (file-exists-p custom-file)
  (load custom-file))

;;; Appearance and basic functionality
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'clean t)

(setq default-frame-alist '((font . "Iosevka-10" )))
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

(setq-default inhibit-tabs-mode nil)
(setq-default tab-width 4)
(setq inhibit-splash-screen t
      inhibit-startup-message t
      scroll-step 3
      auto-save-default nil
      make-backup-files nil
      blink-cursor-mode nil
      ring-bell-function 'ignore
      display-line-numbers-type 'relative
      transient-mark-mode nil
      dired-listing-switches "-alh --group-directories-first"
      compilation-scroll-output t
      gc-cons-threshold 100000000
      compilation-ask-about-save nil
      )

;; (global-hl-line-mode 1)
(global-display-line-numbers-mode)

;;; Package installs and configuration
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package autothemer
  :ensure)

(use-package gruber-darker-theme
  :ensure)

(use-package zenburn-theme
  :ensure)

(use-package undo-fu
  :ensure)

(use-package eglot
  :ensure
  :config
  (add-hook 'eglot-managed-mode-hook #'(lambda () (flymake-mode -1))))

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
  (set-face-background 'iedit-occurrence "blue")
  (evil-multiedit-default-keybinds))

(use-package evil-snipe
  :ensure
  :config
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
  (evil-snipe-override-mode 1))

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

(use-package company
  :ensure
  :config
  (setq company-idle-delay nil)
  (global-company-mode)
  :bind
  ("C-<return>" . company-complete)
  ("C-<tab>"    . dabbrev-expand))

(use-package yasnippet
  :ensure
  :config
  (require 'company)
  ;; Add yasnippet support for all company backends
  ;; https://github.com/syl20bnr/spacemacs/pull/179
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")

  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  (setq yas-snippet-dirs '("~/.emacs.snippets"))
  (yas-global-mode 1))

(use-package general
  :ensure
  :config
  (general-evil-setup t))

(use-package hl-todo
  :ensure
  :config
  (setq hl-todo-keyword-faces
        '(("TODO" . "#FF0000")
          ("NOTE" . "#00FF00")
          ("IMPORTANT" . "#FFFF00")))
  :init
  (global-hl-todo-mode))

(use-package dumb-jump
  :ensure
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package magit 
  :ensure)

(use-package vterm 
  :ensure)

(use-package lua-mode 
  :ensure)

(use-package rust-mode 
  :ensure)

(use-package glsl-mode
  :ensure)

(use-package evil-commentary
  :ensure
  :config
  (evil-commentary-mode))

(use-package org-bullets
  :ensure
  :config
  (add-hook 'org-mode-hook #'(lambda () (org-bullets-mode 1))))

(use-package ido
  :config
  (setq ido-enable-flex-matching t
        ido-everywhere t
        ido-show-dot-for-dired t
        ido-auto-merge-work-directories-length -1)
  (ido-mode 1))

(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Goto: " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))

;;; C-mode
(setq-default c-basic-offset 4
			  c-default-style '((java-mode . "java")
								(awk-mode . "awk")
								(other . "bsd")))
;;(c-set-offset 'case-label '+)

(font-lock-add-keywords 'c-mode
                        '(("internal" . font-lock-keyword-face)
                          ("global" . 'font-lock-keyword-face)))

;;; Keybinds
(defun my-vterm ()
  "Open vterm in other window"
  (interactive)
  (split-window-sensibly)
  (other-window 1)
  (vterm))

;; Binds with SPC prefix
(nvmap :keymaps 'override :prefix "SPC"
  "."			'(find-file :which-key "Find File")
  ">"			'(find-file-other-window :which-key "Open file in other window")
  ","			'(ido-switch-buffer :which-key "Switch Buffer")
  "<"			'(ido-switch-buffer-other-window :which-key "Open buffer in other window")
  "/"           '(grep-find :which-key "Run grep-find")
  "g g"			'(magit :which-key "Magit")
  "o -"			'(dired-jump :which-key "Open Dired here")
  "o t"			'(my-vterm :which-key "Open vterm in other window")
  "o T"			'(vterm :which-key "Open vterm here")

  ;; Compile Binds
  "c"			'(recompile :which-key "Recompile")
  "C"			'(compile :which-key "Compile")

  ;; Window Binds
  "w w"			'(evil-window-next :which-key "Cycle through windows")
  "w h"			'(evil-window-left :which-key "Move left a window")
  "w l"			'(evil-window-right :which-key "Move right a window")
  "w j"			'(evil-window-down :which-key "Move down a window")
  "w k"			'(evil-window-up :which-key "Move up a window")
  "w m"			'(delete-other-windows :which-key "Maximize current window")
  "w n"			'(evil-window-new :which-key "Open a new window")
  "w c"			'(evil-window-delete :which-key "Close active window")
  "w s"			'(evil-window-split :which-key "Split current window horizontally")
  "w v"			'(evil-window-vsplit :which-key "Split current window vertically")

  ;; Buffer Binds
  "b p" '(previous-buffer :which-key "Open previous buffer")
  "b n" '(next-buffer :which-key "Open next buffer")
  "b k" '(kill-current-buffer :which-key "Kill current buffer")
  )

(defun previous-blank-line ()
  "Moves to the previous line containing nothing but whitespace."
  (interactive)
  (search-backward-regexp "^[ \t]*\n"))

(defun next-blank-line ()
  "Moves to the next line containing nothing but whitespace."
  (interactive)
  (forward-line)
  (search-forward-regexp "^[ \t]*\n")
  (forward-line -1))

(defun indent-buffer ()
  "Run indent-region on entire buffer"
  (interactive)
  (indent-region (point-min) (point-max) nil))
;; (add-hook 'before-save-hook 'indent-buffer)

(defun find-corresponding-file ()
  "Finds the file that corresponds to this one and opens it."
  (interactive)
  (setq fname (file-name-sans-extension buffer-file-name))
  (setq result nil)
  (if (string-match "\\.c" buffer-file-name)
      (setq result (concat fname ".h")))
  (if (string-match "\\.h" buffer-file-name)
      (if (file-exists-p (concat fname ".c"))
          (setq result (concat fname ".c")))
    (if (file-exists-p (concat fname ".cpp"))
        (setq result (concat fname ".cpp"))))
  (if result (find-file result)
    (error "Unable to find a corresponding file")))

(defun find-corresponding-file-other-window ()
  "Finds the file that corresponds to this and opens it in the other window."
  (interactive)
  (find-file-other-window buffer-file-name)
  (find-corresponding-file))

;; Normal mode binds
(general-nmap
  "C-e" 'move-end-of-line
  "C-j" 'evil-collection-unimpaired-move-text-down
  "C-k" 'evil-collection-unimpaired-move-text-up
  "C-d" 'kill-region
  "M-j" 'evil-forward-paragraph
  "M-k" 'evil-backward-paragraph
  "M-v" 'find-corresponding-file)

;; idk why general mapping doesn't like to bind "M-S-v" so I have to do it the old fashioned way aka the better way
(global-set-key [(meta shift v)] 'find-corresponding-file-other-window)

;; Insert mode binds
(general-imap
  "C-y" 'evil-paste-after
  "C-a" 'move-beginning-of-line
  "C-e" 'move-end-of-line)

;; Binds without SPC prefix
(general-define-key
 :keymaps 'override
 "M-p" 'previous-error
 "M-n" 'next-error
 "M-o" 'other-window
 "<f2>" 'ido-goto-symbol
 "<f1>" 'indent-buffer)

;;; Launch gud-gdb in a new window
(defun my-gud ()
  "Run gud-gdb in other window"
  (interactive)
  (setq files (directory-files (file-name-directory buffer-file-name)))
  (setq input (completing-read "executable: " files))
  (split-window-sensibly)
  (other-window 1)
  (gud-gdb (concat "gdb --fullname " input)))

;; Sets the default compile command based on OS
(if (string= system-type "windows-nt")
    (setq compile-command "build.bat")
  (setq compile-command "./build.sh"))

