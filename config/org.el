
(use-package org
  :ensure t
  :bind ("\C-cc". org-capture)
  :config
  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-open-at-point)
  (setq org-log-done 'time)
  (setq org-src-fontify-natively t)
  (setq org-startup-folded nil))

(use-package org-bullets
  :ensure t)

(use-package org-plus-contrib
  :ensure t)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
