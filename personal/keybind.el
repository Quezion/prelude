;; --- GENERIC EMACS SETTINGS ---
;; [buffer-move] - transpose buffers - https://github.com/lukhas/buffer-move
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; Eshell
;;(global-unset-key (kbd "<C-x m>"))
;;(global-set-key (kbd "<C-x C-m>")      'eshell-command)

;; Cider
(require 'cider)

(defun cider-insert-and-eval-last-sexp-in-repl (&rest args)
  "Insert the expression preceding point in the REPL buffer and eval."
  (interactive)
  (cider-insert-last-sexp-in-repl t)
  (cider-switch-to-last-clojure-buffer))

;; TODO: get this to insert when cider-mode-map is created via hook
(define-key cider-mode-map (kbd "C-x C-e") 'cider-insert-and-eval-last-sexp-in-repl)
(define-key cider-mode-map (kbd "C-c M-b") 'cider-eval-buffer)

;; Remove the "kill emacs" command combination
(global-unset-key (kbd "s-w"))
