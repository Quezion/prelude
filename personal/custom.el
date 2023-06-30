;; Required for GUI EmacsClient to connect
(require 'server)
(unless (server-running-p)
  (server-start))

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

;; Tell Prelude to stop warning when arrow key is used
(setq prelude-guru nil)

;; --- CONFIGURE PROG MODES ---
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; --- Clojure Mode ---
(defun clojure-only-sort-ns ()
  "Sorts the namespaces of a file on-save, but only for clj/cljs/cljc files"
  (interactive)
  (when (derived-mode-p 'clojure-mode 'clojurec-mode 'clojurescript-mode)
    (clojure-sort-ns)))

(add-hook 'before-save-hook 'clojure-only-sort-ns)

;; --- CUSTOM PACKAGE AUTOGEN GOBBLYGOOK ---

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bc393979763968cba41ca1366ae7ddb2510e034d60a2ef91d145c6d5ed9e3032" default))
 '(package-selected-packages
   '(emacs-ccls objc-mode zop-to-char zenburn-theme yaml-mode which-key web-mode volatile-highlights undo-tree terraform-mode super-save solarized-theme smartrep smartparens rainbow-mode rainbow-delimiters projectile prodigy operate-on-number nlinum move-text magit lsp-ui json-mode js2-mode imenu-anywhere hl-todo guru-mode groovy-mode gnu-elpa-keyring-update git-timemachine git-modes gist flycheck expand-region exec-path-from-shell elisp-slime-nav editorconfig easy-kill discover-my-major diminish diff-hl crux counsel company buffer-move browse-kill-ring anzu ag ace-window)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; --- DISABLES ---
(super-save-mode 0) ;; stop automatically saving everywhere
(setq auto-save-default nil) ;; stop files from autosaving

;; Required on top of the customize-variable require-final-newline
(setq mode-require-final-newline nil)

;; --- MISC ---

;; NOTE: you can run this magic command in bash to generate eshell alias file
;; alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/savefile/eshell/alias
;; see https://www.emacswiki.org/emacs/EshellAlias

;; Keyfreq package -- https://github.com/dacap/keyfreq
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; Magit Auth
(setq auth-sources '("~/.authinfo"))
