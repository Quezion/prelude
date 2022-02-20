(defun format-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

;; Below scratch FNs auto-reopen the *scratch* buffer when it's killed
;; This obviates the need to "figure out how to recreate the *scratch* buffer"
;; Stolen from: https://emacs.stackexchange.com/questions/20/re-open-scratch-buffer
(defun prepare-scratch-for-kill ()
  (save-excursion
    (set-buffer (get-buffer-create "*scratch*"))
    (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer t)))

(defun kill-scratch-buffer ()
  (let (kill-buffer-query-functions)
    (kill-buffer (current-buffer)))
  ;; no way, *scratch* shall live
  (prepare-scratch-for-kill)
  ;; Since we "killed" it, don't let caller try too
  nil)

(prepare-scratch-for-kill)

;; Navigation FNs

(defun smart-line-beginning ()
  "Move point to the beginning of text on the current line; if that is already
the current position of point, then move it to the beginning of the line."
  (interactive)
  (let ((pt (point)))
    (beginning-of-line-text)
    (when (eq pt (point))
      (beginning-of-line))))

(define-key global-map (kbd "C-a") 'smart-line-beginning)
