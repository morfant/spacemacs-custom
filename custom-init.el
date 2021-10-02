;; sclang
;; Paste path from above, appending "/scel/el"
(add-to-list 'load-path "/Users/giy/Library/Application Support/SuperCollider/downloaded-quarks/scel/el")
(require 'sclang)
(setq exec-path (append exec-path '("/Applications/SuperCollider/SuperCollider.app/Contents/MacOS/")))

(custom-set-variables
 '(sclang-runtime-directory "~/SuperCollider/")
 '(sclang-eval-line-forward nil) 
 ;;'(transient-mark-mode t)
)

;; use tab key as tab inserting
(global-set-key (kbd "TAB") 'self-insert-command)


;; counsel-mode on
;;(counsel-mode t)

;;org-mode를 .org로 끝나는 파일에서 활성화
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


;; (eval-after-load 'org
;;   (lambda()
;;     (require 'ob-C)
;;     (require 'org-bullets)
;;     (require 'ox-taskjuggler)
;;     (require 'ox-latex)

;;     ;; …

;;     (setq org-latex-to-pdf-process
;;           '("xelatex -interaction nonstopmode -output-directory %o %f"
;;             "xelatex -interaction nonstopmode -output-directory %o %f"
;;             "xelatex -interaction nonstopmode -output-directory %o %f"))

;;     ;; …

;;     ) ;; lambda
;;   ) ;; eval-after-load

