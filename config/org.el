
(use-package org
  :ensure t
  :bind ("\C-cc". org-capture)
  :config
  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-open-at-point)
  (setq org-log-done 'time)
  (setq org-src-fontify-natively t)
  (setq org-startup-folded nil)
  (set-face-attribute
   '(org-code ((t (:inherit shadow :foreground "dark orange"))))
   '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.1))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.0))))))

(use-package org-bullets
  :ensure t)

(use-package org-plus-contrib
  :ensure t)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
