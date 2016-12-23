
(use-package org
  :ensure t
  :config
  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-open-at-point)
  (setq org-default-notes-file "~/btsync/capture.org")
  (setq org-agenda-files (list "~/btsync/capture.org"))
  (setq org-log-done 'time)
  (setq org-src-fontify-natively t)
  (setq org-startup-folded nil)
  (setq org-hide-emphasis-markers t))

(use-package org-bullets
  :ensure t)

(use-package org-plus-contrib
  :ensure t)

(use-package org-pomodoro
  :ensure t
  :config
  )

(use-package deft
  :ensure t
  :config
  (evil-set-initial-state 'deft-mode 'emacs)
  (evil-set-initial-state 'artist-mode 'emacs)
  (evil-leader/set-key
    "ae" 'deft)
  (setq deft-extensions '("org"))
  (setq deft-use-filename-as-title nil)
  (setq deft-default-extension "org")
  (setq deft-directory "~/btsync/notes"))

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(global-set-key (kbd "\C-cc") 'org-capture)
(global-set-key (kbd "\C-ca") 'org-agenda)

(defun peter/org-mode-config ()
  "org mode key bindings"
  (local-set-key (kbd "C-c l") 'org-pomodoro))

(add-hook 'org-mode-hook 'peter/org-mode-config)
