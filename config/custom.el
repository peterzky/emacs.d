(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/home/peterzky/.emacs.d/bookmarks")
 '(cfs--current-profile "profile1" t)
 '(cfs--profiles-steps (quote (("profile1" . 3))) t)
 '(inhibit-startup-screen t)
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
 '(org-code ((t (:inherit shadow :foreground "dark orange"))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-pomodoro-mode-line ((t (:foreground "dark red"))))
 '(sp-pair-overlay-face ((t nil))))
