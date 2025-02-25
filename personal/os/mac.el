;; Mac specific config here
(set-face-attribute 'default nil :font "Menlo" :height 200)

(x-focus-frame nil) ;; required for proper OSX behavior

(dolist (var '("GPG_AGENT_INFO" "DMDOCS_PATH" "VAULT_ADDR" "SAML2AWS_ROLE"))
  (add-to-list 'exec-path-from-shell-variables var))

;; Set Emacs $PATH like user's $PATH to run same commands
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.hh\\'" . objc-mode))

;; Ensure grep results don't pull in extralong lines & slowdown, only in Mac due to 'cut'
(grep-compute-defaults)
(grep-apply-setting 'grep-find-template
                    (concat grep-find-template " | cut -c 1-2000"))
