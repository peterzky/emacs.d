
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


(use-package deft
  :ensure t
  :config
  (evil-leader/set-key
    "ae" 'deft)
  (setq deft-extensions '("org"))
  (setq deft-directory "~/btsync/notes"))

(use-package evil-mc
  :ensure t
  :config
  (global-evil-mc-mode 1)
  (evil-leader/set-key
    "cc" 'evil-mc-make-all-cursors
    "cd" 'evil-mc-undo-all-cursors
    "cn" 'evil-mc-make-and-goto-next-match
    "cp" 'evil-mc-skip-and-goto-next-match))

(use-package w3m
    :ensure t)

(use-package elfeed
    :ensure t
    :config
    (evil-leader/set-key
      "ee" 'elfeed
      "eu" 'elfeed-update)
    (evil-set-initial-state 'elfeed-search-mode 'emacs)
    (evil-set-initial-state 'elfeed-show-mode 'emacs))
