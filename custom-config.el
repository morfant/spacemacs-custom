

(set-language-environment "Korean")
  (prefer-coding-system 'utf-8)
  ;;(setq default-korean-keyboard "3f")
  (global-set-key (kbd "<kana>") 'toggle-input-method)
  (global-unset-key (kbd "S-SPC"))
  (set-fontset-font "fontset-default" '(#x1100 . #x11ff) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '#x20a9 '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '(#x302e . #x302f) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '(#x3130 . #x318f) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '(#x3200 . #x321e) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '(#x3260 . #x327f) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '(#xa960 . #xa97f) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '(#xac00 . #xd7a3) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '(#xd7b0 . #xd7ff) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '(#xffa1 . #xffdc) '("D2Coding" . "iso10646"))
  (set-fontset-font "fontset-default" '#xffe6 '("D2Coding" . "iso10646"))

(when (eq system-type 'darwin)

  ;; default Latin font (e.g. Consolas)
  ;; but I use Monaco 
  ;;(set-face-attribute 'default nil :family "Monaco")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 130)

  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

  ;; you may want to add different for other charset in this way.
  )

