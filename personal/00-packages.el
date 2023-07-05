;; Loads before any other /personal files, relies on Prelude preloading

;; My packages
(setq prelude-packages (append '(
                                 solarized-theme
                                 rainbow-delimiters
                                 buffer-move
                                 prodigy
                                 terraform-mode
                                 keyfreq
                                 forge
                                 code-review
                                 jdecomp
                                 ) prelude-packages))

(load-file (expand-file-name
            (cond ((eq system-type 'windows-nt) "windows-packages.el")
                  ((eq system-type 'darwin) "mac-packages.el")
                  (t "default-system-packages.el"))
            (concat user-emacs-directory "/personal/os")))

;; Install my packages
(prelude-install-packages)
