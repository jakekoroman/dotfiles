(unless (<= 24 emacs-major-version)
  (error "toxi-theme requires Emacs 24 or later."))
 
(deftheme toxi
  "toxi's dark color theme - forked to my liking")
 
(custom-theme-set-faces
 'toxi
 ;; frame
 `(default ((t (:foreground "#a4ffd8" :background "#0b1210"))))
 `(cursor ((t (:foreground "white"))))
 `(hl-line ((t (:background "#272822"))))
 `(minibuffer-prompt ((t (:foreground "#14bccc" :bold t))))
 `(modeline ((t (:background "#465253" :foreground "#ffffff"))))
 `(modeline-inactive ((t (:background "#162223" :foreground "#355e6b"))))
 `(region ((t (:background "#441ea4"))))
 `(show-paren-match-face ((t (:background "#ffff00"))))
 ;; main
 `(font-lock-builtin-face ((t (:foreground "#00ffff"))))
 `(font-lock-comment-face ((t (:foreground "#7d7d7d"))))
 `(font-lock-constant-face ((t (:foreground "#f2ee81"))))
 `(font-lock-doc-string-face ((t (:foreground "#40be67"))))
 `(font-lock-function-name-face ((t (:foreground "#a4ffd8"))))
 `(font-lock-keyword-face ((t (:foreground "#ffff00"))))
 `(font-lock-string-face ((t (:foreground "#50de77"))))
 `(font-lock-type-face ((t (:foreground "#a4ffd8"))))
 `(font-lock-variable-name-face ((t (:foreground "#a4ffd8"))))
 `(font-lock-warning-face ((t (:bold t :foreground "#ff0055"))))
 ;; dired
 `(dired-directory ((t (:bold t :foreground "#ffff00"))))
 ;; rainbow-delimiters
 `(rainbow-delimiters-depth-1-face ((t (:foreground "#990000"))))
 `(rainbow-delimiters-depth-2-face ((t (:foreground "#383838"))))
 `(rainbow-delimiters-depth-3-face ((t (:foreground "#505050"))))
 `(rainbow-delimiters-depth-4-face ((t (:foreground "#6c6c6c"))))
 `(rainbow-delimiters-depth-5-face ((t (:foreground "#888888"))))
 `(rainbow-delimiters-depth-6-face ((t (:foreground "#a7a7a7"))))
 `(rainbow-delimiters-depth-7-face ((t (:foreground "#c4c4c4"))))
 `(rainbow-delimiters-depth-8-face ((t (:foreground "#e1e1e1"))))
 `(rainbow-delimiters-depth-9-face ((t (:foreground "#ffffff"))))
 ;; ido
 `(ido-first-match ((t (:foreground "#ffff00"))))
 `(ido-only-match ((t (:foreground "#00ff00"))))
 `(ido-subdir ((t (:foreground "#00ffff"))))
 ;; iedit
 `(iedit-occurrence ((t (:background "#441ea4"))))
 ;; whitespace
 `(whitespace-space ((t (:foreground "#595959"))))
 ;; yasnippet
 `(yas/field-highlight-face ((t (:background "#383830"))))
 ;; vertico
 `(vertico-current ((t (:background "#441ea4"))))
 ;; org
 `(org-hide ((t (:foreground "#0b1210"))))
 `(org-block ((t (:background "#1b2220"))))
 `(org-link ((t (:foreground "#56cff2" :underline t)))))
 
;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
 
(provide-theme 'toxi)
 
