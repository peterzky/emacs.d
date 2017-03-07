(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (evil-leader/set-key
    "gs" 'magit-status))

(use-package git-timemachine
  :ensure t
  :config
  (evil-leader/set-key
    "gm" 'git-timemachine))

(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))
