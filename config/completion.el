(use-package company-tern
  :diminish tern-mode
  :ensure t)

(use-package company
  :diminish company-mode
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-to-list 'company-backends 'company-tern)
  (define-key company-active-map (kbd "s-n") #'company-select-next-or-abort)
  (define-key company-active-map (kbd "s-p") #'company-select-previous-or-abort))

(use-package yasnippet
  :diminish yas-minor-mode
  :ensure t
  :config
  (yas-global-mode 1)
  (evil-leader/set-key
    "yn" 'yas-new-snippet
    "ye" 'yas/visit-snippet-file
    ))

;; (defun check-expansion ()
;;   (save-excursion
;;     (if (looking-at "\\_>") t
;;       (backward-char 1)
;;       (if (looking-at "\\.") t
;; 	(backward-char 1)
;; 	(if (looking-at "->") t nil)))))

;; (defun do-yas-expand ()
;;   (let ((yas-fallback-behavior 'return-nil))
;;     (yas-expand)))

;; (defun tab-indent-or-complete ()
;;   (interactive)
;;   (if (minibufferp)
;;       (minibuffer-complete)
;;     (if (or (not yas-minor-mode)
;; 	    (null (do-yas-expand)))
;; 	(if (check-expansion)
;; 	    (company-complete-common)
;; 	  (indent-for-tab-command)))))

;; (global-set-key [tab] 'tab-indent-or-complete)
