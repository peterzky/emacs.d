(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (evil-leader/set-key
    "gs" 'magit-status))

(use-package git-timemachine
  :ensure t
  :config
  (evil-leader/set-key "gm" 'git-timemachine))

(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode +1)
  (evil-leader/set-key "gg" 'git-gutter:popup-hunk))

