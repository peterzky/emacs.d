
(use-package company
  :diminish company-mode
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (define-key company-active-map (kbd "C-n") #'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-p") #'company-select-previous-or-abort))

(use-package yasnippet
  :diminish yas-minor-mode
  :ensure t
  :config
  (yas-global-mode 1)
  (evil-leader/set-key
    "yn" 'yas-new-snippet
    "yv" 'yas-visit-snippet-file
    "yt" 'yas-describe-tables
    "yi" 'yas-insert-snippet))
