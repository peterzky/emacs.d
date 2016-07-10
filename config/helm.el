(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (setq helm-always-two-windows t)
  (helm-mode 1)
  (helm-autoresize-mode 1)

  (global-set-key (kbd "s-x") 'helm-M-x)
  (evil-leader/set-key
    "bb" 'helm-mini)
  )

(use-package helm-swoop
    :ensure t
    :config
    (evil-leader/set-key
      "s" 'helm-swoop))

(use-package helm-ag
  :ensure t
  :config
  (evil-leader/set-key
    "ag" 'helm-ag
    "ap" 'helm-ag-project-root))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package helm-descbinds
  :ensure t
  :config
  (helm-descbinds-mode))
