;; File for my personal solarized.el customizations
;; I've tried to reduce the surface area that we touch
;; But the default Solarized theme averages colors & can't give the desired effect
;; Hence why we create a custom color palette here (which could break if news keys are added)

(defun darktron-create-color-palette ()
  "Create color-palette from CORE-PALETTE.
The returned color-palette has the same format as `solarized-color-palette'"
  (let ((darkest-base   "#101a1c")
        (brightest-base "#f2eee1")
        (yellow         "#ffcf58")
        (orange         "#f59137")
        (red            "#FF410D")
        (magenta        "#bd5dba")
        (violet         "#ffb8fc")
        (blue           "#2d92cf")
        (cyan           "#25c3db")
        (green          "#0ecb80")
        )

    `((base03 . ,"#101a1c")
      (base02 . ,"#42464f")
      (base01 . ,"#586e75")
      (base00 . ,"#98a0b5")
      (base0  . ,"#9faabd")
      (base1  . ,"#93a1a1")
      (base2  . ,"#f2ecd8")
      (base3  . ,"#f2eee1")

      ;; Solarized accented colors
      (yellow    . ,yellow)
      (orange    . ,orange)
      (red       . ,red)
      (magenta   . ,magenta)
      (violet    . ,violet)
      (blue      . ,blue)
      (cyan      . ,cyan)
      (green     . ,green)

      ;; Darker and lighter accented colors
      ;; Only use these in exceptional circumstances!
      (yellow-d  . ,(solarized-color-blend darkest-base   yellow  0.80 2))
      (yellow-l  . ,(solarized-color-blend brightest-base yellow  0.80 2))
      (orange-d  . ,(solarized-color-blend darkest-base   orange  0.80 2))
      (orange-l  . ,(solarized-color-blend brightest-base orange  0.80 2))
      (red-d     . ,(solarized-color-blend darkest-base   red     0.80 2))
      (red-l     . ,(solarized-color-blend brightest-base red     0.80 2))
      (magenta-d . ,(solarized-color-blend darkest-base   magenta 0.80 2))
      (magenta-l . ,(solarized-color-blend brightest-base magenta 0.80 2))
      (violet-d  . ,(solarized-color-blend darkest-base   violet  0.80 2))
      (violet-l  . ,(solarized-color-blend brightest-base violet  0.80 2))
      (blue-d    . ,(solarized-color-blend darkest-base   blue    0.80 2))
      (blue-l    . ,(solarized-color-blend brightest-base blue    0.80 2))
      (cyan-d    . ,(solarized-color-blend darkest-base   cyan    0.80 2))
      (cyan-l    . ,(solarized-color-blend brightest-base cyan    0.80 2))
      (green-d   . ,(solarized-color-blend darkest-base   green   0.80 2))
      (green-l   . ,(solarized-color-blend brightest-base green   0.80 2))

      (yellow-1bg  . ,(solarized-color-blend darkest-base yellow  0.85 2))
      (orange-1bg  . ,(solarized-color-blend darkest-base orange  0.85 2))
      (red-1bg     . ,(solarized-color-blend darkest-base red     0.85 2))
      (magenta-1bg . ,(solarized-color-blend darkest-base magenta 0.85 2))
      (blue-1bg    . ,(solarized-color-blend darkest-base blue    0.85 2))
      (cyan-1bg    . ,(solarized-color-blend darkest-base cyan    0.85 2))
      (green-1bg   . ,(solarized-color-blend darkest-base green   0.85 2))
      (violet-1bg  . ,(solarized-color-blend darkest-base violet  0.85 2))

      (yellow-1fg  . ,(solarized-color-blend brightest-base yellow  0.30 2))
      (orange-1fg  . ,(solarized-color-blend brightest-base orange  0.30 2))
      (red-1fg     . ,(solarized-color-blend brightest-base red     0.30 2))
      (magenta-1fg . ,(solarized-color-blend brightest-base magenta 0.30 2))
      (violet-1fg  . ,(solarized-color-blend brightest-base violet  0.30 2))
      (blue-1fg    . ,(solarized-color-blend brightest-base blue    0.30 2))
      (cyan-1fg    . ,(solarized-color-blend brightest-base cyan    0.30 2))
      (green-1fg   . ,(solarized-color-blend brightest-base green   0.30 2))

      (yellow-2bg  . ,(solarized-color-blend darkest-base yellow  0.60 2))
      (orange-2bg  . ,(solarized-color-blend darkest-base orange  0.60 2))
      (red-2bg     . ,(solarized-color-blend darkest-base red     0.60 2))
      (magenta-2bg . ,(solarized-color-blend darkest-base magenta 0.60 2))
      (violet-2bg  . ,(solarized-color-blend darkest-base violet  0.60 2))
      (blue-2bg    . ,(solarized-color-blend darkest-base blue    0.60 2))
      (cyan-2bg    . ,(solarized-color-blend darkest-base cyan    0.60 2))
      (green-2bg   . ,(solarized-color-blend darkest-base green   0.60 2))

      (yellow-2fg  . ,(solarized-color-blend brightest-base yellow  0.45 2))
      (orange-2fg  . ,(solarized-color-blend brightest-base orange  0.45 2))
      (red-2fg     . ,(solarized-color-blend brightest-base red     0.45 2))
      (magenta-2fg . ,(solarized-color-blend brightest-base magenta 0.45 2))
      (violet-2fg  . ,(solarized-color-blend brightest-base violet  0.45 2))
      (blue-2fg    . ,(solarized-color-blend brightest-base blue    0.45 2))
      (cyan-2fg    . ,(solarized-color-blend brightest-base cyan    0.45 2))
      (green-2fg   . ,(solarized-color-blend brightest-base green   0.45 2)))))

(let ((color-palette (darktron-create-color-palette)))
  (solarized-create-theme-file 'dark 'solarized-tron-dark
  color-palette
  '((custom-theme-set-faces
     theme-name

     `(font-lock-keyword-face ((,class (:foreground ,blue :weight ,s-maybe-bold))))
     `(font-lock-variable-name-face ((,class (:foreground ,blue))))
     `(font-lock-constant-face ((,class (:foreground ,magenta))))

     `(rainbow-delimiters-depth-1-face ((,class (:foreground ,s-base01))))
     `(rainbow-delimiters-depth-2-face ((,class (:foreground ,s-base2))))
     `(rainbow-delimiters-depth-3-face ((,class (:foreground ,cyan))))
     `(rainbow-delimiters-depth-4-face ((,class (:foreground ,magenta))))
     `(rainbow-delimiters-depth-5-face ((,class (:foreground ,green))))
     `(rainbow-delimiters-depth-6-face ((,class (:foreground ,yellow))))
     `(rainbow-delimiters-depth-7-face ((,class (:foreground ,s-base01))))
     `(rainbow-delimiters-depth-8-face ((,class (:foreground ,s-base2))))
     `(rainbow-delimiters-depth-9-face ((,class (:foreground ,cyan))))
     `(rainbow-delimiters-depth-10-face ((,class (:foreground ,magenta))))
     `(rainbow-delimiters-depth-11-face ((,class (:foreground ,green))))
     `(rainbow-delimiters-depth-12-face ((,class (:foreground ,yellow))))
     `(rainbow-delimiters-unmatched-face
       ((,class (:foreground ,base0 :background ,base03 :inverse-video t))))))))

(add-hook 'after-init-hook (lambda () (load-theme 'solarized-tron-dark)))
