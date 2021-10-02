
;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; User Info

(setq user-mail-address "you@email.com")
;; Put your email address in here


;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Basics 

(global-visual-line-mode 1)

; Redefine some EVIL keys back to normal Emacs keys for more fluid editing

(with-eval-after-load 'evil-maps
	(define-key evil-motion-state-map (kbd "C-a") 'move-beginning-of-line)
	(define-key evil-motion-state-map (kbd "C-e") 'move-end-of-line)
	(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
	(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line))

; If you want to redefine more, here are their names
; https://github.com/magnars/.emacs.d/blob/master/site-lisp/evil/evil-maps.el


;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Mac Specific

;; Uncomment if colours look off
;;(setq ns-use-srgb-colorspace nil)


;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Spellcheck Setup

(with-eval-after-load "ispell"
	(setq ispell-program-name "aspell")
	(ispell-set-spellchecker-params)
	(setq ispell-dictionary "en_GB"))



;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Terminal Environment

(defun my-shell-setup ()
	(interactive)
	(setq buffer-face-mode-face '(:family "PxPlus IBM VGA8" :height 160))
	(buffer-face-mode))
(add-hook 'term-mode-hook #'my-shell-setup)



;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Image Environment

(defun set-image-borderless ()
	(setq left-margin-width 0)
	(setq right-margin-width 0)
	(set-fringe-mode 0)
	(setq global-hl-line-mode nil)
	(image-transform-fit-to-height))
(add-hook 'image-mode-hook #'set-image-borderless)



;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


(defun my-toggle-margins-low ()
"Set margins in current buffer for use in narrow windows."
(interactive)
  (if (or (> left-margin-width 0) (> right-margin-width 0))
    (progn
      (setq left-margin-width 0)
      (setq right-margin-width 0)
      (set-fringe-mode nil)
      (setq global-hl-line-mode t)
      (set-window-buffer (selected-window) (current-buffer)))
    (setq left-margin-width 5)
    (setq right-margin-width 5)
    (set-fringe-mode 0)
    (setq global-hl-line-mode nil)
    (set-window-buffer (selected-window) (current-buffer))))

(global-set-key [f5] #'my-toggle-margins-low)


(defun my-toggle-margins-wide ()
"Set margins in current buffer for use in full-screen."
(interactive)
  (if (or (> left-margin-width 0) (> right-margin-width 0))
    (progn
      (setq left-margin-width 0)
      (setq right-margin-width 0)
      (set-fringe-mode nil)
      (setq global-hl-line-mode t)
      (set-window-buffer (selected-window) (current-buffer)))
    (setq left-margin-width 80)
    (setq right-margin-width 80)
    (set-fringe-mode 0)
    (setq global-hl-line-mode nil)
    (set-window-buffer (selected-window) (current-buffer))))

(global-set-key [f8] #'my-toggle-margins-wide)



;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Projectile

;;(setq projectile-completion-system 'ivy)
(setq projectile-ignore-global '(".DS_Store" ".gitmodules" ".gitignore"))
;(setq projectile-project-search-path '("~/work/"))



;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Markdown

(defun markdown-setup ()
	(interactive)
	(visual-line-mode 1)
	(setq buffer-face-mode-face '(:family "iA Writer Quattro S" :height 200 :foreground "#aba7a0"))
	(buffer-face-mode)
	(setq line-spacing 3)
	(setq left-margin-width 8)
	(setq right-margin-width 8)
	(flyspell-mode 1)
	(setq global-hl-line-mode nil)
	(setq header-line-format " "))
(add-hook 'markdown-mode-hook #'markdown-setup)
(add-hook 'markdown-mode-hook 'prettify-symbols-mode)


;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Org-Mode

(defun split-and-indirect-orgtree ()
"Splits window to the right and opens an org tree section in it"
(interactive)
(split-window-right)
(org-tree-to-indirect-buffer)
(windmove-right))


(defun kill-and-unsplit-orgtree ()
"Kills the cloned buffer and deletes the window."
(interactive)
(kill-this-buffer)
(delete-window))


(with-eval-after-load 'org
	;(setq org-agenda-files '("~/Org/Notes/"
	;                         "~/Org/Agenda/"))
	;(setq org-default-notes-file "~/Org/Notes/notes.org")
	(setq org-ellipsis "5")
	(setq org-catch-invisible-edits 'show-and-error)
	(setq org-hide-emphasis-markers t)
	(setq org-fontify-whole-heading-line t)
	(setq org-tags-column 0)
	(setq org-bullets-bullet-list '("⬢" "◆" "▲" "■"))
	(setq org-adapt-indentation t)
	(setq line-move-visual t)
	; Change Default Keymaps
	(define-key org-mode-map (kbd "C-S-<return>") 'org-insert-subheading)
	; Shortcuts to Interactive Functions
	(define-key org-mode-map [f9]  #'split-and-indirect-orgtree)
	(define-key org-mode-map [f12] #'kill-and-unsplit-orgtree)
	(define-key org-mode-map [f7]  #'org-html-export-to-html))


; Things we can't set as defaults above, we can set here
(defun org-setup ()
	(setq line-spacing 3)
	(flyspell-mode 1)
	(setq global-hl-line-mode nil)
	(set-fringe-mode 0)
	(setq left-margin-width 5)
	(setq right-margin-width 5)
	(setq header-line-format " ")
	(olivetti-mode 1))
(add-hook 'org-mode-hook #'org-setup)

;; The Hooks! Might be faster to set this as separate hooks instead of one big function
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'prettify-symbols-mode)


(defun my-org-config/setup-buffer-face ()
	(setq buffer-face-mode-face '(:family "iA Writer Mono S"))
	(buffer-face-mode)
)
(add-hook 'org-agenda-mode-hook 'my-org-config/setup-buffer-face)

(custom-theme-set-faces
	'user
	'(variable-pitch ((t (:family "iA Writer Quattro S" :height 200 :foreground "#a5967e"))))
	'(fixed-pitch ((t (:family "iA Writer Mono S" :height 180 ))))
	'(flyspell-incorrect ((t (:foreground "#d3ebe9" :background "#c23127"))))
	'(header-line ((t (:background "#1c1e1f" :height 220))))
	'(org-document-title        ((t (:foreground "#f2f2f2" :weight bold :height 400))))
	'(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
	'(org-document-info         ((t (:foreground "#51c4b5"))))
	'(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
	'(org-block                 ((t (:inherit fixed-pitch))))
	'(org-link                  ((t (:foreground "royal blue" :underline t))))
	'(org-property-value        ((t (:inherit fixed-pitch))) t)
	'(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
	'(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
	'(org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
	'(org-indent                ((t (:inherit (org-hide fixed-pitch)))))
	'(org-level-1               ((t (:foreground "#ffaf69"))))
	'(org-level-2               ((t (:foreground "#3fc6b7"))))
	'(org-level-3               ((t (:foreground "#dc4d59"))))
	'(org-list-dt               ((t (:foreground "#ea412b"))))
	'(org-table                 ((t (:inherit fixed-pitch))) t)
	'(org-ellipsis              ((t (:foreground "#51c4b5")))))


;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;; Writing Window Setup

(defun write-window-setup ()
(interactive)
	(split-window-right)
	(windmove-right)
	(split-window-below)
	(windmove-left)
	(find-file "*draft.org" t)
	(windmove-right)
	(find-file "*notes.md" t)
	(windmove-left))
	
(with-eval-after-load 'dired
	(define-key dired-mode-map [f3] #'write-window-setup))

