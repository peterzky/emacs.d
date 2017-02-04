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

;; (use-package w3m
;;   :ensure t)

(use-package rainbow-mode
  :diminish t
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode)
  (add-hook 'conf-xdefaults-mode-hook #'rainbow-mode)
  )


(use-package avy
  :ensure t
  :config
  (evil-leader/set-key
    "SPC" 'avy-goto-word-1))

(global-set-key (kbd "s-/") 'dabbrev-expand)



(use-package shell-pop
  :ensure t
  :config
  (global-set-key (kbd "C-`") 'shell-pop)
  (setq shell-pop-full-span t))

(defalias 'open 'find-file-other-window)

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))

(use-package paradox
  :ensure t
  :config
  (setq paradox-github-token t)
  (evil-set-initial-state 'paradox-menu-mode 'emacs)
  (evil-leader/set-key
    "pr" 'paradox-list-packages
    "pu" 'paradox-upgrade-packages))

(use-package crux
  :diminish t
  :ensure t
  :config
  (crux-reopen-as-root-mode)
  )


(use-package systemd
  :ensure t
  :config
  )
;; (use-package hungry-delete
;;   :ensure t
;;   :config
;;   (global-hungry-delete-mode)
;;   )

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

;; spell check world

(global-set-key (kbd "C-\\") 'ispell-word)
