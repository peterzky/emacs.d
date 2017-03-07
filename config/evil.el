
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
    "ff" 'helm-find-files
    "fl" 'helm-locate
    "ll" 'linum-mode
    "he" 'elisp-index-search
    "an" 'peter/open-note-file
    "qq" 'delete-frame
    "qQ" 'save-buffers-kill-emacs
    "wv" 'peter/split-horizontally
    "ws" 'peter/split-vertically
    "wd" 'delete-window
    "fed" 'peter/edit-config-file
    "fee" 'peter/open-config-folder
    "cc" 'flycheck-mode
    ;; "zz" 'delete-frame
    "cl" 'evilnc-comment-or-uncomment-lines
    ;; "ESC" 'delete-other-windows
    "TAB" 'peter/switch-buffer)
  )


(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  (evil-define-key 'motion help-mode-map (kbd "<tab>") 'forward-button)
  (evil-define-key 'motion help-mode-map (kbd "S-<tab>") 'backward-button)
  (add-to-list 'evil-motion-state-modes 'debugger-mode)
  (add-to-list 'evil-motion-state-modes 'special-mode))

(setq evil-normal-state-tag "N"
      evil-insert-state-tag "I"
      evil-motion-state-tag "M"
      evil-emacs-state-tag  "E"
      evil-visual-state-tag "V"
      evil-motion-state-cursor	'(box "YellowGreen")
      evil-normal-state-cursor	'(box "YellowGreen")
      evil-insert-state-cursor	'(bar "#F86155")
      evil-emacs-state-cursor	'(bar "SkyBlue2")
      evil-visual-state-cursor	'(box "gray")
      )

(use-package evil-numbers
    :ensure t
    :config
    ;; (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
    ;; (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
    )


;; enter emacs state when artist mode is activated.
(defun artist-mode-toggle-emacs-state ()
  (if artist-mode
      (evil-emacs-state)
    (evil-exit-emacs-state)))

(add-hook 'artist-mode-hook #'artist-mode-toggle-emacs-state)
