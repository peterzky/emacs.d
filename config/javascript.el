(defun peter/js-comint-kbd ()
  (local-set-key "\C-x\C-e" 'js-send-last-sexp)
  (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
  (local-set-key "\C-cb" 'js-send-buffer)
  (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
  (local-set-key "\C-cl" 'js-load-file-and-go)
)

(use-package js-comint 
    :ensure t
    :config
    (add-hook 'js2-mode-hook 'peter/js-comint-kbd)
    )

(use-package json-mode
    :ensure t
    :config)

(use-package web-beautify
  :ensure t
  :config)


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
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(evil-define-key 'normal js2-mode-map (kbd "gd") 'tern-find-definition)
(evil-define-key 'normal js2-mode-map (kbd "g=") 'web-beautify-js-buffer)
(evil-define-key 'normal js2-mode-map (kbd "gp") 'run-js)




