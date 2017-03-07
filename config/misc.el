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
  (setq projectile-switch-project-action 'projectile-dired)
  (add-to-list 'projectile-globally-ignored-directories "node_modules") 
  (add-to-list 'projectile-globally-ignored-files ".tern-port"))

(use-package rainbow-mode
  :diminish rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode)
  (add-hook 'conf-xdefaults-mode-hook #'rainbow-mode))


(use-package avy
  :ensure t
  :bind ("C-;" . avy-goto-char-2))

(use-package shell-pop
  :ensure t
  :bind ("C-`" . shell-pop)
  :config
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
  (crux-reopen-as-root-mode))

;;For editing systemd file
(use-package systemd
  :ensure t)

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;; spell check world
(global-set-key (kbd "C-\\") 'ispell-word)

(use-package info+
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package ranger
  :ensure t
  :config
  (setq ranger-override-dired t)
  (setq ranger-deer-show-details nil)
  (setq ranger-show-literal nil)
  (evil-leader/set-key "r" 'deer))

;; (use-package multiple-cursors
;;   :ensure t
;;   :bind (("C-S-c C-S-c" . 'mc/edit-lines)
;; 	 ("C->" . 'mc/mark-next-like-this)
;; 	 ("C-<" . 'mc/mark-previous-like-this)
;; 	 ("C-c C-<" . 'mc/mark-all-like-this)))
