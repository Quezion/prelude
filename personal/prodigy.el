;; File to define services runnable from the Prodigy service manager

(require 'prodigy)

(prodigy-define-tag
  :name 'dmx
  :ready-message "Build completed\\.")

(prodigy-define-tag
  :name 'prod
  :env '(("ENV" "prod"
          "COMPANY" "gra")))

(prodigy-define-service
  :name "DMX"
  :command "make"
  :args '("dev")
  :cwd "~/repos/gr/dmx/"
  :tags '(dmx)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

;; :env doesn't correctly apply for some reason, need to troubleshoot why
;; (prodigy-define-service
;;   :name "DMX Prod"
;;   :command "make"
;;   :args '("dev")
;;   :cwd "~/repos/gr/dmx/"
;;   :tags '(dmx prod)
;;   :stop-signal 'sigkill
;;   :kill-process-buffer-on-stop t
;;   :env '(("ENV" "prod"
;;           "COMPANY" "gra")))
