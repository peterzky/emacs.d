(diminish 'auto-revert-mode)

(use-package undo-tree
  :diminish undo-tree-mode)

(use-package abbrev
  :diminish abbrev-mode)

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(use-package magit
  :ensure t
  :config
  (evil-leader/set-key
    "gs" 'magit-status))


(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (add-to-list 'projectile-globally-ignored-directories "node_modules") 
  (add-to-list 'projectile-globally-ignored-files ".tern-port")
  (evil-leader/set-key
    "pp" 'projectile-switch-project
    "pf" 'projectile-find-file))

(use-package smartparens
  :diminish smartparens-mode
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  (add-hook 'js2-mode-hook #'smartparens-mode))

(use-package w3m
  :ensure t)

(use-package rainbow-mode
  :diminish t
  :ensure t
  :config
  ;; (add-hook 'prog-mode-hook #'rainbow-mode)
  )

(use-package ranger
  :ensure t
  :config
  (setq ranger-override-dired t)
  (evil-leader/set-key
    "ar" 'deer))

