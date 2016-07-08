
(use-package avy
  :ensure t
  :config
  (evil-leader/set-key
    "SPC" 'avy-goto-char-2))

(use-package ido-vertical-mode
  :ensure t
  :config
  (setq ido-enable-flex-matching t)
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode 1)) 

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

(use-package shell-pop
  :ensure t
  :config
  (global-set-key (kbd "<f1>") 'shell-pop)
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
  ;; (evil-set-initial-state 'paradox-menu-mode 'emacs)
  (evil-leader/set-key
    "pr" 'paradox-list-packages))


(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "s-x") 'smex))

(use-package bookmark+
  :ensure t
  :config
  (evil-leader/set-key
      "ll" 'bookmark-bmenu-list
      "lm" 'bookmark-set))
