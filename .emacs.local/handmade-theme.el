(unless (<= 24 emacs-major-version)
  (error "handmade-theme requires Emacs 24 or later."))
 
(deftheme handmade
  "Dark theme based on Casey Muratori's handmade hero theme")
 
(custom-theme-set-faces
 'handmade
 `(default ((t (:foreground "burlywood3" :background "#181818"))))
 `(cursor ((t (:background "#40FF40"))))
 `(region ((t (:background "dark blue"))))
 `(font-lock-builtin-face ((t (:foreground "burlywood3"))))
 `(font-lock-comment-face ((t (:foreground "gray50"))))
 ;; `(font-lock-constant-face ((t (:foreground "olive drab"))))
 `(font-lock-doc-face ((t (:foreground "gray50"))))
 `(font-lock-function-name-face ((t (:foreground "burlywood3"))))
 `(font-lock-keyword-face ((t (:foreground "DarkGoldenrod3"))))
 `(font-lock-string-face ((t (:foreground "olive drab"))))
 `(font-lock-type-face ((t (:foreground "burlywood3"))))
 `(font-lock-variable-name-face ((t (:foreground "burlywood3"))))
 `(font-lock-constant-face ((t (:foreground "burlywood3"))))
 `(mode-line ((t (:background "#242424"))))
 ;; dired
 `(dired-directory ((t (:foreground "DarkGoldenrod3"))))
 `(dired-symlink ((t (:foreground "cyan"))))
 ;; vertico
 `(vertico-current ((t (:background "navy"))))
 ;; ido
 `(ido-subdir ((t (:foreground "cyan"))))
 ;; iedit
 `(iedit-occurrence ((t (:background "navy")))))
 
;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
 
(provide-theme 'handmade)
