
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
    "gg" 'gist-list
    "ag" 'ag
    "nn" 'peter/open-note-file
    "qq" 'save-buffers-kill-emacs
    "ws" 'split-window-below
    "wv" 'split-window-right
    "wd" 'delete-window
    "ae" 'deft
    "fed" 'peter/edit-config-file
    "zz" 'delete-frame
    "cl" 'evilnc-comment-or-uncomment-lines
    "'" 'shell-pop
    "s" 'swiper
    "SPC" 'avy-goto-char-2
    "ESC" 'delete-other-windows
    "TAB" 'peter/switch-buffer))
