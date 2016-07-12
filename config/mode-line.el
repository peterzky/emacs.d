(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (setq powerline-default-separator nil)
  (setq spaceline-minor-modes-separator nil)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (spaceline-info-mode)
  (spaceline-toggle-buffer-modified-on)
  (spaceline-toggle-selection-info-on)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-version-control-on)
  (spaceline-toggle-window-number-off)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-info-topic-on)
  )

(setq evil-mc-mode-line-prefix "¢")

(setq projectile-mode-line
      (quote
       (:eval
	(if
	    (file-remote-p default-directory)
	    " Projectile"
	  (format "[%s]"
		  (projectile-project-name))))))

(spaceline-define-segment buffer-modified
  "test"
  (when (buffer-modified-p)
  (propertize "Ⲙ" 'face '(:foreground "dark red")))
  ;; :face ((t
  ;; 	  (:inherit 'default-face :foreground "dark red")))
  )

(spaceline-compile)
