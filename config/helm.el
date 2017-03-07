(use-package helm
  :diminish helm-mode
  :ensure t
  :bind (("s-x" . helm-M-x)
	 ("M-x" . helm-M-x))
  :config
  (require 'helm-config)
  (helm-mode 1)
  (setq helm-display-header-line nil)
  (setq helm-display-source-at-screen-top nil)
  (setq helm-autoresize-min-height 10)
  (setq helm-mode-fuzzy-match t)
  (setq helm-split-window-in-side-p t)
  (setq helm-completion-in-region-fuzzy-match t)
  (helm-autoresize-mode 1)
  ;;add bookmark to helm mini sources
  (add-to-list 'helm-mini-default-sources 'helm-source-bookmark-files&dirs 'append)
  (evil-leader/set-key
    "s" 'helm-occur
    "r" 'helm-show-kill-ring
    "bb" 'helm-mini
    "i" 'helm-imenu
    "`" 'helm-mini))

(use-package helm-ag
  :ensure t
  :config
  (evil-leader/set-key
    "ag" 'helm-ag
    "ap" 'helm-ag-project-root))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package helm-systemd
  :ensure t
  :config
  (setq helm-systemd-buffer-name "*Systemd log*")
  (evil-leader/set-key
    "ad" 'helm-systemd))

(use-package helm-descbinds
  :ensure t
  :config
  (setq helm-descbinds-window-style 'same-window)
  (helm-descbinds-mode))

(defun *-popwin-help-mode-off ()
  "Turn `popwin-mode' off for *Help* buffers."
  (when (boundp 'popwin:special-display-config)
    (customize-set-variable 'popwin:special-display-config
			    (delq 'help-mode popwin:special-display-config))))

(defun *-popwin-help-mode-on ()
  "Turn `popwin-mode' on for *Help* buffers."
  (when (boundp 'popwin:special-display-config)
    (customize-set-variable 'popwin:special-display-config
			    (add-to-list 'popwin:special-display-config 'help-mode nil #'eq))))

(add-hook 'helm-minibuffer-set-up-hook #'*-popwin-help-mode-off)
(add-hook 'helm-cleanup-hook #'*-popwin-help-mode-on)

;;fix helm cursor
(defun peter/hide-cursor-in-helm-buffer ()
  "Hide the cursor in helm buffers."
  (with-helm-buffer
    (setq cursor-in-non-selected-windows nil)))

(add-hook 'helm-after-initialize-hook 'peter/hide-cursor-in-helm-buffer)


(defun peter/helm-toggle ()
  "toggle helm-mini"
  (interactive)
  (if (helm-alive-p)
      (helm-keyboard-quit)
    (helm-mini)))

(global-set-key (kbd "M-`") 'peter/helm-toggle)
