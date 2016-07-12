(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/home/peterzky/.emacs.d/bookmarks")
 '(cfs--current-profile "profile1" t)
 '(cfs--profiles-steps (quote (("profile1" . 3))) t)
 '(cfs-disable-bold t)
 '(cfs-disable-bold-italic t)
 '(cfs-disable-italic t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (smart-mode-line youdao-dictionary yasnippet window-numbering w3m use-package smartparens shell-pop popwin paradox org-plus-contrib org-bullets js2-mode helm-systemd helm-projectile helm-proc helm-descbinds helm-ag evil-surround evil-nerd-commenter evil-mc evil-magit evil-leader emmet-mode elfeed deft company-tern chinese-pyim-greatdict chinese-pyim chinese-fonts-setup bookmark+ avy auto-compile ample-theme)))
 '(projectile-mode-line
   (quote
    (:eval
     (if
	 (file-remote-p default-directory)
	 " Projectile"
       (format "[%s]"
	       (projectile-project-name))))))
 '(shell-pop-shell-type
   (quote
    ("eshell-pop" "*eshell-pop*"
     (lambda nil
       (eshell shell-pop-term-shell))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-mc-cursor-default-face ((t (:background "blue violet" :inverse-video nil))))
 '(org-code ((t (:inherit shadow :foreground "dark orange"))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-pomodoro-mode-line ((t (:foreground "dark red"))))
 '(sp-pair-overlay-face ((t nil)))
 '(spaceline-evil-insert ((t (:background "#F86155" :foreground "#3E3D31" :inherit (quote mode-line)))))
 )
