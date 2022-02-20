;; Desc: Custom eshell prompt, displayed when running M-x eshell
;; URL: http://www.modernemacs.com/post/custom-eshell/

;; Separator between esh-sections
(setq esh-sep "  ")  ; or " | "

;; Separator between an esh-section icon and form
(setq esh-section-delim " ")

;; Eshell prompt header
(setq esh-header "\n ")  ; or "\n┌─"

;; Eshell prompt regexp and string. Unless you are varying the prompt by eg.
;; your login, these can be the same.
(setq eshell-prompt-regexp " ")   ; or "└─> "
(setq eshell-prompt-string " ")   ; or "└─> "

;; Makes prompt automatically jump to bottom on input, but this also prevents you from easily using the buffer
;; (setq eshell-scroll-to-bottom-on-input t)

(require 'dash)
(require 's)
(require 'magit)
(require 'cl)

(defmacro with-face (STR &rest PROPS)
  "Return STR propertized with PROPS."
  `(propertize ,STR 'face (list ,@PROPS)))

(defmacro esh-section (NAME ICON FORM &rest PROPS)
  "Build eshell section NAME with ICON prepended to evaled FORM with PROPS."
  `(setq ,NAME
         (lambda () (when ,FORM
                      (-> ,ICON
                          (concat esh-section-delim ,FORM)
                          (with-face ,@PROPS))))))

(defun esh-acc (acc x)
  "Accumulator for evaluating and concatenating esh-sections."
  (--if-let (funcall x)
      (if (s-blank? acc)
          it
        (concat acc esh-sep it))
    acc))

(defun esh-prompt-func ()
  "Build `eshell-prompt-function'"
  (concat esh-header
          (-reduce-from 'esh-acc "" eshell-funcs)
          "\n"
          eshell-prompt-string
          ))


(esh-section esh-dir
             "\xf07c"  ;  (faicon folder)
             (abbreviate-file-name (eshell/pwd))
             '(:foreground "gold" :bold ultra-bold :underline t))

(esh-section esh-git
             "\xe907"  ;  (git icon)
             (magit-get-current-branch)
             '(:foreground "pink"))

(esh-section esh-clock
             "\xf017"  ;  (clock icon)
             (format-time-string "%H:%M:%S" (current-time))
             '(:foreground "forest green"))

(esh-section esh-num
             "\xf0c9"  ;  (list icon)
             (number-to-string esh-prompt-num)
             '(:foreground "brown"))

;; Choose which eshell-funcs to enable
(setq eshell-funcs (list esh-dir esh-git esh-clock))

;; Enable the new eshell prompt
(setq eshell-prompt-function 'esh-prompt-func)
