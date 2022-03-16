;; --- GENERIC EMACS SETTINGS ---
;; [buffer-move] - transpose buffers - https://github.com/lukhas/buffer-move
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; Eshell
(global-set-key (kbd "C-x C-b") 'eshell-command)

;; TODO: get this to insert when cider-mode-map is created via hook
(define-key cider-mode-map (kbd "C-x C-e") 'cider-insert-and-eval-last-sexp-in-repl)
(define-key cider-mode-map (kbd "C-c M-b") 'cider-eval-buffer)

;; Remove the "kill emacs" command combination
(global-unset-key (kbd "s-w"))

;; Prodigy
(global-unset-key (kbd "C-x p"))
(global-set-key (kbd "C-x p") 'prodigy)

;; Reconfigure smartparens - ref https://github.com/Fuco1/.emacs.d/blob/master/files/smartparens.el
;; see cheatsheet at https://gist.github.com/jsmestad/1059d15e8debf5f2e7e81c92052c67d2
(define-key smartparens-mode-map (kbd "C-<left>") 'left-word)
(define-key smartparens-mode-map (kbd "C-<right>") 'right-word)
(define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-end-of-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-beginning-of-sexp)

;; Code-Review (integrates with Magit+Forge)

;; TODO: below maps aren't loaded at init time, so causes an error. figure out how to hook it in later
;; (define-key forge-topic-mode-map (kbd "C-c r") 'code-review-forge-pr-at-point)
;; (define-key code-review-mode-map (kbd "C-c C-n") 'code-review-comment-jump-next)
;; (define-key code-review-mode-map (kbd "C-c C-p") 'code-review-comment-jump-previous)
