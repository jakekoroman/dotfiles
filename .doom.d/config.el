;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jake Koroman" user-mail-address "jakekoroman@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka"
                           :size 14
                           :weight 'Regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'gruber-darker)
;;(setq doom-theme 'doom-zenburn)
(setq doom-theme 'doom-wilmersdorf)
;;(setq doom-theme 'doom-tokyo-night)
;;(setq doom-theme 'doom-vibrant)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(load! "thirdparty.el")

(setq emojify-user-emojis '((":pepehands:" . (("name" . "Pepe Hands")
                                              ("image" . "~/dotfiles/assets/pepehands.jpg")
                                              ("style" . "unicode")))))

;; Dashboard Settings
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Bonjour et Bienvenue!")
(setq dashboard-center-content t)
(setq dashboard-startup-banner 'logo)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-items '((recents . 10)
                        (projects . 5)
                        (agenda . 5)))
(setq dashboard-footer-messages '("Mon français est marde :pepehands:"))

;; Removes exit confirmation
(setq confirm-kill-emacs nil)

;; Org settings
(after! org
  ;;(setq org-agenda-files '("~/org"))
  (setq org-todo-keywords '((sequence "TODO(t)" "PROG(p)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")))
  (setq org-log-done 'time))

;; Starts emojify immediately
(add-hook 'after-init-hook #'global-emojify-mode)
(add-hook 'after-init-hook #'ido-mode)

;; Adds support for odin lang errors in the compilation buffer
(after! compile (add-to-list 'compilation-error-regexp-alist-alist '(odin
                                                                     "\\(.+?\\)\(\\([0-9]+\\):\\([0-9]+\\\).*"
                                                                     1 2 3))
  (add-to-list 'compilation-error-regexp-alist 'odin))

;; Allows ido to open dired in pwd
(setq ido-show-dot-for-dired t)

;; Sets global word wrap
(+global-word-wrap-mode +1)

;; Smex keybinds
(map! :nv "M-x"
      #'smex
      :nv "M-X"
      #'smex-major-mode-commands
      :nv "C-c C-c M-x"
      #'execute-extended-command
      :leader ":" #'smex)

(map! :nv "<f5>"
      #'rustic-cargo-run
      :nv "<f8>" #'rustic-cargo-fmt)
