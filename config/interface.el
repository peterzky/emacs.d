(use-package avy
  :ensure t
  :config
  (evil-leader/set-key
    "SPC" 'avy-goto-char-2))

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
    "pr" 'paradox-list-packages))


