(use-package web-beautify
  :ensure t
  :config
  )


(use-package tern
  :ensure t)

(use-package js2-mode
  :ensure t
  :interpreter "node"
  :config
  (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
  )

(use-package emmet-mode
  :ensure t)

(global-set-key [C-tab] 'emmet-expand-yas)

(add-hook 'html-mode 'emmet-mode)
(add-hook 'js2-jsx-mode 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))

;;jsx mode  
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(evil-define-key 'normal js2-mode-map (kbd "gd") 'tern-find-definition)
(evil-define-key 'normal js2-mode-map (kbd "g=") 'web-beautify-js-buffer)




