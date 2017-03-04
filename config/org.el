
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

;; Org to Jekyll
(use-package org2jekyll
  :ensure t
  :config)

(custom-set-variables
 '(org2jekyll-blog-author "Peterzky")
 '(org2jekyll-source-directory (expand-file-name "~/org/"))
 '(org2jekyll-jekyll-directory (expand-file-name "~/Projects/Blog/"))
 '(org2jekyll-jekyll-drafts-dir "")
 '(org2jekyll-jekyll-posts-dir "_posts/")
 '(org-publish-project-alist
   `(("default"
      :base-directory ,(org2jekyll-input-directory)
      :base-extension "org"
      :publishing-directory ,(org2jekyll-output-directory)
      :publishing-function org-html-publish-to-html
      :headline-levels 4
      :section-numbers nil
      :with-toc nil
      :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
      :html-preamble t
      :recursive t
      :make-index t
      :html-extension "html"
      :body-only t)
     ("post"
      :base-directory ,(org2jekyll-input-directory)
      :base-extension "org"
      :publishing-directory ,(org2jekyll-output-directory org2jekyll-jekyll-posts-dir)
      :publishing-function org-html-publish-to-html
      :headline-levels 4
      :section-numbers nil
      :with-toc nil
      :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
      :html-preamble t
      :recursive t
      :make-index t
      :html-extension "html"
      :body-only t)
     ("images"
      :base-directory ,(org2jekyll-input-directory "img")
      :base-extension "jpg\\|gif\\|png"
      :publishing-directory ,(org2jekyll-output-directory "img")
      :publishing-function org-publish-attachment
      :recursive t)
     ("js"
      :base-directory ,(org2jekyll-input-directory "js")
      :base-extension "js"
      :publishing-directory ,(org2jekyll-output-directory "js")
      :publishing-function org-publish-attachment
      :recursive t)
     ("css"
      :base-directory ,(org2jekyll-input-directory "css")
      :base-extension "css\\|el"
      :publishing-directory ,(org2jekyll-output-directory "css")
      :publishing-function org-publish-attachment
      :recursive t)
     ("web" :components ("images" "js" "css")))))

(setq org2jekyll-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "C-c . n") 'org2jekyll-create-draft)
        (define-key map (kbd "C-c . p") 'org2jekyll-publish-post)
        (define-key map (kbd "C-c . P") 'org2jekyll-publish-posts)
        (define-key map (kbd "C-c . l") 'org2jekyll-list-posts)
        (define-key map (kbd "C-c . d") 'org2jekyll-list-drafts)
        map))
