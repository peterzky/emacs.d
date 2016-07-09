(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (helm-mode 1)
  (global-set-key (kbd "s-x") 'helm-M-x)
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
