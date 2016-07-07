
(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))


(use-package ranger
  :ensure t
  :config
  (evil-leader/set-key
    "ar" 'ranger)
  )

(use-package magit
  :ensure t
  :config
  (evil-leader/set-key
    "gs" 'magit-status)
  )


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
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  (add-hook 'js2-mode-hook #'smartparens-mode))


(use-package helm-swoop
    :ensure t
    :config
    (evil-leader/set-key
      "s" 'helm-swoop))


(use-package deft
  :ensure t
  :config
  (evil-leader/set-key
    "ae" 'deft)
  (setq deft-extensions '("org"))
  (setq deft-directory "~/btsync/notes"))


(use-package helm-ag
  :ensure t
  :config
  (evil-leader/set-key
    "ag" 'helm-ag
    "ap" 'helm-ag-project-root)
  (add-hook 'ag-search-finished-hook 'select-window-2))



