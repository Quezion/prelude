;; Mac specific config here
(set-face-attribute 'default nil :font "Menlo" :height 200)

(x-focus-frame nil) ;; required for proper OSX behavior

(dolist (var '("GPG_AGENT_INFO" "DMDOCS_PATH" "VAULT_ADDR" "SAML2AWS_ROLE"))
  (add-to-list 'exec-path-from-shell-variables var))

;; Set Emacs $PATH like user's $PATH to run same commands
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
