(require 'cider)

(defun cider-insert-and-eval-last-sexp-in-repl (&rest args)
  "Insert the expression preceding point in the REPL buffer and eval."
  (interactive)
  (cider-insert-last-sexp-in-repl t)
  (cider-switch-to-last-clojure-buffer))
