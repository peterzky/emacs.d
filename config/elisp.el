
;; (use-package paredit
;;   :diminish paredit-mode
;;   :ensure t
;;   :config
;;   (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;;   (add-hook 'lisp-mode-hook 'enable-paredit-mode)
;;   (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;;   (add-hook 'scheme-mode-hook 'enable-paredit-mode))

(use-package rainbow-delimiters
  :diminish rainbow-delimiters-mode
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

;; (add-hook 'emacs-lisp-hook #'smartparens-mode)
