(require 'solarized)
(deftheme solarized-tron-dark
  "The solarized-tron-dark colour theme of Solarized colour theme flavor.")
(solarized-with-color-variables 'dark 'solarized-tron-dark
  '((base03 . "#101a1c") (base02 . "#42464f") (base01 . "#586e75")
    (base00 . "#98a0b5") (base0 . "#9faabd") (base1 . "#93a1a1")
    (base2 . "#f2ecd8") (base3 . "#f2eee1") (yellow . "#ffcf58")
    (orange . "#f59137") (red . "#FF410D") (magenta . "#bd5dba")
    (violet . "#ffb8fc") (blue . "#2d92cf") (cyan . "#25c3db")
    (green . "#0ecb80") (yellow-d . "#3b3929") (yellow-l . "#f8e8c6")
    (orange-d . "#3b3023") (orange-l . "#f8dbbf") (red-d . "#40261d")
    (red-l . "#ffcfb7") (magenta-d . "#302838")
    (magenta-l . "#e9d1da") (violet-d . "#393642")
    (violet-l . "#f5e4e7") (blue-d . "#1a2f3b") (blue-l . "#d2dbde")
    (cyan-d . "#1a373d") (cyan-l . "#d4e6e0") (green-d . "#19392e")
    (green-l . "#d1e8cd") (yellow-1bg . "#313126")
    (orange-1bg . "#312a22") (red-1bg . "#34231d")
    (magenta-1bg . "#282530") (blue-1bg . "#172a33")
    (cyan-1bg . "#183034") (green-1bg . "#17312a")
    (violet-1bg . "#2f2f38") (yellow-1fg . "#fed883")
    (orange-1fg . "#faad6b") (red-1fg . "#ff7f51")
    (magenta-1fg . "#cf8ac6") (violet-1fg . "#fcc9f4")
    (blue-1fg . "#7cacd5") (cyan-1fg . "#80d0dd")
    (green-1fg . "#76d79d") (yellow-2bg . "#685b35")
    (orange-2bg . "#67462a") (red-2bg . "#6c301d")
    (magenta-2bg . "#503656") (violet-2bg . "#66546c")
    (blue-2bg . "#21465d") (cyan-2bg . "#215761")
    (green-2bg . "#1e5a42") (yellow-2fg . "#fddd98")
    (orange-2fg . "#fbbb84") (red-2fg . "#ff986f")
    (magenta-2fg . "#d8a0cc") (violet-2fg . "#fad1f0")
    (blue-2fg . "#98bad8") (cyan-2fg . "#9cd7de")
    (green-2fg . "#94ddab"))
  '((custom-theme-set-faces theme-name
                            `(font-lock-keyword-face
                              ((,class
                                (:foreground ,blue :weight
                                             ,s-maybe-bold))))
                            `(font-lock-variable-name-face
                              ((,class (:foreground ,blue))))
                            `(font-lock-constant-face
                              ((,class (:foreground ,magenta))))
                            `(rainbow-delimiters-depth-1-face
                              ((,class (:foreground ,s-base01))))
                            `(rainbow-delimiters-depth-2-face
                              ((,class (:foreground ,s-base2))))
                            `(rainbow-delimiters-depth-3-face
                              ((,class (:foreground ,cyan))))
                            `(rainbow-delimiters-depth-4-face
                              ((,class (:foreground ,magenta))))
                            `(rainbow-delimiters-depth-5-face
                              ((,class (:foreground ,green))))
                            `(rainbow-delimiters-depth-6-face
                              ((,class (:foreground ,yellow))))
                            `(rainbow-delimiters-depth-7-face
                              ((,class (:foreground ,s-base01))))
                            `(rainbow-delimiters-depth-8-face
                              ((,class (:foreground ,s-base2))))
                            `(rainbow-delimiters-depth-9-face
                              ((,class (:foreground ,cyan))))
                            `(rainbow-delimiters-depth-10-face
                              ((,class (:foreground ,magenta))))
                            `(rainbow-delimiters-depth-11-face
                              ((,class (:foreground ,green))))
                            `(rainbow-delimiters-depth-12-face
                              ((,class (:foreground ,yellow))))
                            `(rainbow-delimiters-unmatched-face
                              ((,class
                                (:foreground ,base0 :background
                                             ,base03 :inverse-video t)))))))
(provide-theme 'solarized-tron-dark)
(provide 'solarized-tron-dark-theme)
