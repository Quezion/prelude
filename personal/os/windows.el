;; Windows specific config here
(set-face-attribute 'default nil :font "Meslo LG S" :height 140)

(server-start) ;; start Emacs daemon server so subsequent launches can connect to it

(load "~/.emacs.d/personal/os/w32-browser.el") ;; adds cmd w32explore to open Windows explorer

;;(defalias 'w32explore 'browse-file-directory)

;;(def browse-file-directory w32explore)

(defun browse-file-directory (file)
  (interactive "fFile: ")
  (w32explore file))

(grep-compute-defaults)
;;(setq counsel-etags-find-program "c:\\\\whatever-path\\\\bin\\\\find.exe")

;;(executable-find "ag")

;; Make sure Unix tools are in front of `exec-path'
(let ((bash (executable-find "bash")))
  (when bash
    (push (file-name-directory bash) exec-path)))

;; Update PATH from exec-path
(let ((path (mapcar 'file-truename
                    (append exec-path
                            (split-string (getenv "PATH") path-separator t)))))
  (setenv "PATH" (mapconcat 'identity (delete-dups path) path-separator)))

(set-language-environment "UTF-8") ;; prevent repeated prompt "set default coding system"

;; Enable JDEComp, to decompile Java sourcecode. Requires local installpath somewhere
;; Only enabled in Windows for now to avoid breaking .class files on other OS
(jdecomp-mode 1)
(customize-set-variable 'jdecomp-decompiler-type 'cfr)
(customize-set-variable 'jdecomp-decompiler-paths
                        '((cfr . "~/qdesktop_files/cfr.jar")))

;; Have to manually EVAL this after init to work -- might be fixable by putting in post-init hook
(advice-add 'jdecomp--jar-p :override
            (lambda (file) (file-exists-p file)))
