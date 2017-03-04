(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method (quote pushy))
 '(org-publish-project-alist
   (\`
    (("default" :base-directory
      (\,
       (org2jekyll-input-directory))
      :base-extension "org" :publishing-directory
      (\,
       (org2jekyll-output-directory))
      :publishing-function org-html-publish-to-html :headline-levels 4 :section-numbers nil :with-toc nil :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>" :html-preamble t :recursive t :make-index t :html-extension "html" :body-only t)
     ("post" :base-directory
      (\,
       (org2jekyll-input-directory))
      :base-extension "org" :publishing-directory
      (\,
       (org2jekyll-output-directory org2jekyll-jekyll-posts-dir))
      :publishing-function org-html-publish-to-html :headline-levels 4 :section-numbers nil :with-toc nil :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>" :html-preamble t :recursive t :make-index t :html-extension "html" :body-only t)
     ("images" :base-directory
      (\,
       (org2jekyll-input-directory "img"))
      :base-extension "jpg\\|gif\\|png" :publishing-directory
      (\,
       (org2jekyll-output-directory "img"))
      :publishing-function org-publish-attachment :recursive t)
     ("js" :base-directory
      (\,
       (org2jekyll-input-directory "js"))
      :base-extension "js" :publishing-directory
      (\,
       (org2jekyll-output-directory "js"))
      :publishing-function org-publish-attachment :recursive t)
     ("css" :base-directory
      (\,
       (org2jekyll-input-directory "css"))
      :base-extension "css\\|el" :publishing-directory
      (\,
       (org2jekyll-output-directory "css"))
      :publishing-function org-publish-attachment :recursive t)
     ("web" :components
      ("images" "js" "css")))))
 '(package-selected-packages
   (quote
    (helm tern projectile htmlize org2jekyll evil-mu4e shm hindent gorepl-mode company-ghc ghc info+ flycheck-gometalinter systemd youdao-dictionary yasnippet window-numbering web-beautify use-package spaceline smartparens shell-pop scion rainbow-mode pp-c-l popwin paradox org-pomodoro org-plus-contrib org-bullets json-mode js2-mode js-comint hungry-delete helm-systemd helm-projectile helm-descbinds helm-ag haskell-mode graphviz-dot-mode go-eldoc git-timemachine fcitx expand-region evil-surround evil-numbers evil-nerd-commenter evil-mc evil-magit evil-leader emmet-mode deft crux company-tern company-go chinese-pyim-greatdict chinese-pyim avy auto-compile ample-theme)))
 '(shell-pop-shell-type
   (quote
    ("eshell-pop" "*eshell-pop*"
     (lambda nil
       (eshell shell-pop-term-shell)))))
 '(smtpmail-smtp-server "smtp.qq.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
