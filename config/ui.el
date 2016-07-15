;; (add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
;; (load-theme 'peter-dark t)
(use-package ample-theme
  :init (progn (load-theme 'ample t t)
               (load-theme 'ample-flat t t)
               (load-theme 'ample-light t t)
               (enable-theme 'ample-flat)
	       )
  :defer t
  :ensure t)


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
  (spaceline-toggle-buffer-encoding-abbrev-on)
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
  "buffer modified indicator Ⲙ"
  (cond
   ((buffer-modified-p)
    (if buffer-read-only
	(propertize "R" 'face '(:foreground "#1F3A93"))
      (propertize "M" 'face '(:foreground "#CF000F")))
    )
   (buffer-read-only
    (propertize "R" 'face '(:foreground "#1F3A93"))
    ))
  )


(spaceline-compile)
