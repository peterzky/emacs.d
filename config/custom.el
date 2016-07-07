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
 '(ivy-current-match ((t (:inherit font-lock-builtin-face :underline t))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "orange"))))
 '(ivy-minibuffer-match-face-2 ((t (:foreground "orange red"))))
 '(ivy-minibuffer-match-face-3 ((t (:foreground "dark violet" :weight bold))))
 '(ivy-minibuffer-match-face-4 ((t (:foreground "indian red" :weight bold))))
 '(org-code ((t (:inherit shadow :foreground "dark orange"))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-pomodoro-mode-line ((t (:foreground "dark red"))))
 '(sp-pair-overlay-face ((t nil)))
 '(swiper-line-face ((t nil)))
 '(swiper-match-face-2 ((t (:foreground "dark orange" :underline t))))
 '(swiper-match-face-3 ((t (:foreground "cyan" :underline t))))
 '(swiper-match-face-4 ((t (:foreground "firebrick" :underline nil)))))
