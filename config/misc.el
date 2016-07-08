
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

(use-package w3m
    :ensure t)

(use-package elfeed
    :ensure t
    :config
    (evil-leader/set-key
      "ee" 'elfeed
      "eu" 'elfeed-update)
    (evil-set-initial-state 'elfeed-search-mode 'emacs)
    (evil-set-initial-state 'elfeed-show-mode 'emacs)
    (setq-default elfeed-search-filter "@1-week-ago +unread ")
    (define-key elfeed-search-mode-map "j" #'next-line)
    (define-key elfeed-search-mode-map "k" #'previous-line)
    (define-key elfeed-search-mode-map "h" #'backward-char)
    (define-key elfeed-search-mode-map "l" #'forward-char)
    (define-key elfeed-show-mode-map "k" #'scroll-down-line)
    (define-key elfeed-show-mode-map "j" #'scroll-up-line)
    )

