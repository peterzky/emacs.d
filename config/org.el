
(use-package org
  :ensure t
  :config
  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-open-at-point)
  (setq org-startup-indented t)
  (setq org-default-notes-file "~/Nextcloud/org/capture.org")
  (setq org-agenda-files (list "~/Nextcloud/org/capture.org" "~/Nextcloud/notes"))
  (setq org-directory "~/Nextcloud/org")
  (setq org-mobile-inbox-for-pull "~/Nextcloud/org/flagged.org")
  (setq org-mobile-directory "~/Nextcloud/MobileOrg")
  (setq org-log-done 'time)
  (setq org-src-fontify-natively t)
  (setq org-startup-folded nil)
  (setq org-hide-emphasis-markers t)
  (setq org-refile-targets '((nil :maxlevel . 2)
                                (org-agenda-files :maxlevel . 2)))
  ;; Refile in a single go
  (setq org-outline-path-complete-in-steps nil)         
  ;; Show full paths for refiling
  (setq org-refile-use-outline-path t)                  
  (evil-leader/set-key
    "op" 'org-mobile-push
    "oP" 'org-mobile-pull
    "aa" 'org-todo-list
    "ac" 'org-capture
    ))

(use-package org-bullets
  :ensure t)

(use-package org-plus-contrib
  :ensure t)

(use-package org-pomodoro
  :ensure t
  :config
  ;; (org-defkey org-agenda-mode-map "I" 'org-pomodoro)
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
  (setq deft-use-filter-string-for-filename t)
  ;; (setq deft-org-mode-title-prefix t)
  (setq deft-default-extension "org")
  (setq deft-directory "~/Nextcloud/notes")
  (setq deft-file-naming-rules
      '((noslash . "-")
        (nospace . "-")
        (case-fn . downcase)))
  )

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(global-set-key (kbd "\C-cc") 'org-capture)
(global-set-key (kbd "\C-ca") 'org-agenda)

(defun peter/agenda-mode-config ()
  "agenda mode key bindings"
  (define-key org-agenda-mode-map "j" 'org-agenda-next-line)
  (define-key org-agenda-mode-map "k" 'org-agenda-previous-line)
  (define-key org-agenda-mode-map "g" 'org-agenda-goto-date)
  (define-key org-agenda-mode-map "n" 'org-agenda-capture)
  )

(add-hook 'org-agenda-mode-hook 'peter/agenda-mode-config)
