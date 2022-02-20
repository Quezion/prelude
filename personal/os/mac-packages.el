(setq prelude-packages (append '(exec-path-from-shell ;; doesn't work on windows due to missing/different printf
                                 ) prelude-packages))
