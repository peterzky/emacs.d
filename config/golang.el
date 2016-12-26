(use-package company-go
  :ensure t
  :config
  )

(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook (lambda ()
			    (set (make-local-variable 'company-backends) '(company-go))
			    (company-mode)))
  )
