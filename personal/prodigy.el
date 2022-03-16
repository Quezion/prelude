;; File to define services runnable from the Prodigy service manager

(require 'prodigy)

(prodigy-define-tag
  :name 'shadow-clj
  :ready-message "HTTP server available")

(prodigy-define-tag
  :name 'shadow-cljs
  :ready-message "Build completed\\.")

(prodigy-define-tag
  :name 'lein-test
  :ready-message "0 failures\\.")

(prodigy-define-tag
  :name 'antq-dependencies ;; this comes after every other dmx check, treat as success
  :ready-message "Checking for outdated dependencies with antq")

(prodigy-define-tag
  :name 'prod
  :env '(("ENV" "prod"
          "COMPANY" "gri")))

(prodigy-define-service
  :name "DMX Dev"
  :url "http://localhost:8080"
  :command "make"
  :args '("dev")
  :cwd "~/repos/gr/dmx/"
  :tags '(shadow-cljs) ;; Prodigy only uses one :ready-message trigger, even if 2 defined
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "DMX Check"
  :command "make"
  :args '("check")
  :cwd "~/repos/gr/dmx/"
  :tags '(antq-dependencies)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "DMX Test"
  :url "http://localhost:9999"
  :command "make"
  :args '("test")
  :cwd "~/repos/gr/dmx/"
  :tags '(lein-test)
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

;; --- FUNCTIONS ---
(defun prodigy-find-service-by-buffer (&optional buffer)
  "Find `prodigy' service based on BUFFER name."
  (let* ((this-prodigy-buffer-name (buffer-name buffer))
         (service (-find
                   (lambda (service)
                     (string= (prodigy-buffer-name service)
                              this-prodigy-buffer-name))
                   (prodigy-services))))
    service))

(defun prodigy-restart-view ()
  "Restart a `prodigy-view-mode' buffer."
  (interactive)
  (-if-let (service (prodigy-find-service-by-buffer))
      (prodigy-with-refresh
       (prodigy-restart-service service))
    (error "Current buffer is not a prodigy view buffer.")))

;; This doesn't work because there's no actual prodigy-view-mode-map
;; Unfortunately , there's also no "prodigy-mode", so no way to hook this up?
;; (Maybe a global hook that adds to the keymap when buffer is opened with name *prodigy- ?)
;; (define-key prodigy-view-mode-map (kbd "C-c r") #'prodigy-restart-view)
