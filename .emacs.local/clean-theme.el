(require 'autothemer)

(autothemer-deftheme
 clean "My 'clean' theme"

 ((((class color) (min-colors #xFFFFFF)))

  (clean-black      "#181818")
  (clean-white      "#e4e4ef")
  (clean-gray       "#5e5e63")
  (clean-green      "#4e9a06")
  (clean-orange     "#ffaf00")
  (clean-red        "#ff0000")
  (clean-blue       "#467dc4"))

 ((default                         (:foreground clean-white :background clean-black))
  (cursor                          (:background clean-white))
  (region                          (:background "gray15"))
  (hl-line                         (:background "gray15"))
  (font-lock-comment-face          (:foreground clean-gray))
  (font-lock-keyword-face          (:foreground clean-orange))
  (font-lock-constant-face         (:foreground clean-white))
  (font-lock-variable-name-face    (:foreground clean-white))
  (font-lock-function-name-face    (:foreground clean-white))
  (font-lock-string-face           (:foreground clean-green))
  (font-lock-type-face             (:foreground clean-blue))
  (show-paren-match                (:foreground clean-red))
  ))

(provide-theme 'clean)
