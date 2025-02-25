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

;; Buffer FNs

(defun buffer-file-name-to-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

;; Project Specific FNs

;; Initializes FTD
(defun initialize-ftd ()
  (interactive)
  (cider-interactive-eval
   "(require 'moonshot.core)
    (in-ns 'moonshot.core)
    (-main)"))

;; NOTE: Makes CIDER autorun this on connect, could potentially break depending on codebase
(add-hook 'cider-connected-hook (lambda ()
                                  (if (cl-search "/ftd/" default-directory)
                                      (initialize-ftd))))

;; BUGFIX for when undo-tree-buffer becomes too big and crashes Emacs on filesave consistently across reloads
;; see https://stackoverflow.com/questions/12730158/emacs-cleaning-up-undo-tree
(defun clear-undo-tree ()
  (interactive)
  (setq buffer-undo-tree nil))
