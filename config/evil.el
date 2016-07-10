
(use-package evil-magit
  :ensure t)

(use-package evil-nerd-commenter
  :ensure t)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;;must before evil mode 
(use-package evil-leader
  :ensure t
  :config
  (setq evil-leader/in-all-states t)
  (setq evil-leader/no-prefix-mode-rx
	'("elfeed-.*-mode"
	  "paradox-.*-mode"
	  ))
  (global-evil-leader-mode 1) 
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "bd" 'kill-this-buffer
    "fs" 'save-buffer
    "ff" 'find-file
    "nn" 'peter/open-note-file
    "qq" 'save-buffers-kill-emacs
    "wv" 'peter/split-horizontally
    "ws" 'peter/split-vertically
    "wd" 'delete-window
    "fed" 'peter/edit-config-file
    "zz" 'delete-frame
    "cl" 'evilnc-comment-or-uncomment-lines
    "ESC" 'delete-other-windows
    "TAB" 'peter/switch-buffer))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  (add-to-list 'evil-motion-state-modes 'debugger-mode)
  (add-to-list 'evil-motion-state-modes 'special-mode)
  )

(use-package evil-mc
  :ensure t
  :config
  (global-evil-mc-mode 1)
  (evil-leader/set-key
    "cc" 'evil-mc-make-all-cursors
    "cd" 'evil-mc-undo-all-cursors
    "cn" 'evil-mc-make-and-goto-next-match
    "cp" 'evil-mc-skip-and-goto-next-match))

