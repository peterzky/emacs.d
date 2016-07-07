
(use-package avy
  :ensure t)

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

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
    "pf" 'projectile-find-file)
  )

(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode)
  (evil-leader/set-key
    "1" 'select-window-1
    "2" 'select-window-2
    "3" 'select-window-3
    "4" 'select-window-4
    "5" 'select-window-5
    "6" 'select-window-6
    "7" 'select-window-7
    "8" 'select-window-8
    "9" 'select-window-9
    "0" 'select-window-0)
  )

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  (add-hook 'js2-mode-hook #'smartparens-mode))

(use-package smex
  :ensure t
  :bind ("s-x" . smex))


(use-package swiper
  :ensure t)


(use-package paradox
  :ensure t
  :config
  (setq paradox-github-token t))

(use-package deft
  :ensure t
  :config
  (setq deft-extensions '("org"))
  (setq deft-directory "~/btsync/notes"))

(use-package shell-pop
  :ensure t
  :bind ("<f1>" . shell-pop)
  :config
  (setq shell-pop-full-span t)
  (setq 'shell-pop-shell-type
	(quote
	 ("eshell-pop" "*eshell-pop*"
	  (lambda nil
	    (eshell shell-pop-term-shell))))))

(defalias 'open 'find-file-other-window)

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))
