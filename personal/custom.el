;; Required for GUI EmacsClient to connect
(require 'server)
(unless (server-running-p)
  (server-start))

(setq auto-save-default nil) ;; stop files from autosaving

;; --- GENERIC GUI WINDOW SETTINGS ---
(setq ns-use-native-fullscreen nil)
(setq ns-auto-hide-menu-bar t)
(setq frame-resize-pixelwise t)

(global-set-key (kbd "C-x f") 'toggle-frame-fullscreen)
(add-hook 'after-init-hook (lambda () (toggle-frame-maximized)))

;; --- LOAD /OS/ SPECIFIC SETTINGS ---
(load-file (expand-file-name
            (cond ((eq system-type 'windows-nt) "windows.el")
                  ((eq system-type 'darwin) "mac.el")
                  (t "default-system.el"))
            (concat user-emacs-directory "/personal/os")))


;; --- GENERIC EMACS SETTINGS ---
(setq whitespace-line-column 97);; set when trailing lines will be highlighted

;; Remove line-numbers after load (auto-setup by Prelude)
(defun nolinum ()
  (global-display-line-numbers-mode 0)
  (global-linum-mode 0))
(add-hook 'prog-mode-hook 'nolinum)

;; Ensure grep results don't pull in extralong lines & slowdown
(grep-compute-defaults)
(grep-apply-setting 'grep-find-template
                    (concat grep-find-template " | cut -c 1-2000"))

;; --- CONFIGURE PROG MODES ---
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; --- CUSTOM PACKAGE AUTOGEN GOBBLYGOOK ---

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" default)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; --- MISC ---

;; NOTE: you can run this magic command in bash to generate eshell alias file
;; alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/savefile/eshell/alias
;; see https://www.emacswiki.org/emacs/EshellAlias
