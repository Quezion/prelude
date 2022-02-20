;; Loads before any other /personal files, relies on Prelude preloading

;; My packages
(setq prelude-packages (append '(
                                 solarized-theme
                                 rainbow-delimiters
                                 buffer-move
                                 exec-path-from-shell
                                 prodigy
                                 ) prelude-packages))

;; Install my packages
(prelude-install-packages)
