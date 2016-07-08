
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state))

(use-package evil-magit
  :ensure t)

(use-package evil-nerd-commenter
  :ensure t)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-leader
  :ensure t
  :config
  (setq evil-leader/in-all-states t)
  (global-evil-leader-mode 1)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "bb" 'switch-to-buffer
    "bd" 'kill-this-buffer
    "fs" 'save-buffer
    "ff" 'find-file
    "nn" 'peter/open-note-file
    "qq" 'save-buffers-kill-emacs
    "ws" 'peter/split-horizontally
    "wv" 'peter/split-vertically
    "wd" 'delete-window
    "fed" 'peter/edit-config-file
    "zz" 'delete-frame
    "cl" 'evilnc-comment-or-uncomment-lines
    "ESC" 'delete-other-windows
    "TAB" 'peter/switch-buffer))
