
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
    "gg" 'customize-group
    "ff" 'helm-find-files
    "he" 'elisp-index-search
    "nn" 'peter/open-note-file
    "qq" 'save-buffers-kill-emacs
    "wv" 'peter/split-horizontally
    "ws" 'peter/split-vertically
    "wd" 'delete-window
    "fed" 'peter/edit-config-file
    "zz" 'delete-frame
    "cl" 'evilnc-comment-or-uncomment-lines
    "ESC" 'delete-other-windows
    "nw" 'widen
    "TAB" 'peter/switch-buffer)
  (evil-leader/set-key-for-mode 'org-mode
    "ns" 'org-narrow-to-subtree))


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
  (global-evil-mc-mode 1))


(setq evil-normal-state-tag "N"
      evil-insert-state-tag "I"
      evil-motion-state-tag "M"
      evil-emacs-state-tag "E"
      evil-visual-state-tag "V"
      evil-motion-state-cursor '(box "YellowGreen")
      evil-normal-state-cursor '(box "YellowGreen")
      evil-insert-state-cursor '(bar "#F86155")
      evil-emacs-state-cursor '(bar "SkyBlue2")
      evil-visual-state-cursor '(box "White")
      )
