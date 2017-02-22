(use-package ghc
  :ensure t
  :config
  (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
  )

(use-package company-ghc
  :ensure t
  :config
  (add-to-list 'company-backends 'company-ghc)
  )

(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  ;; (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
  )

(use-package scion
  :ensure t
  :config
  )

(defun my-haskell-mode-hook ()
  ;; (local-set-key "C-c C-l" 'inferior-haskell-load-file)
  )

;; (evil-set-initial-state 'interactive-haskell-mode 'evil-insert-state)
