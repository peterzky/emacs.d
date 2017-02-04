(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method (quote pushy))
 '(cfs--current-profile "profile1" t)
 '(cfs--profiles-steps (quote (("profile1" . 4))) t)
 '(cfs-disable-bold t)
 '(cfs-disable-bold-italic t)
 '(cfs-disable-italic t)
 '(custom-safe-themes
   (quote
    ("19addfa172776b89c3586a8bdf86eb49ff64315d5a171e59e563e022d76c1f83" "9510184026d50bad57007bb4912395fef4625c4473c1b0ba721757c2764ff90a" "fe477b3a40d9ce7e34c246b91d8af99db4b925fb1704d263ba4af63c031619d4" "558a826e87956525532923c45820bc63740cd146fd2cbb5a4dd1ba7bc21de513" "4ddda82f297c0cb74063e1dcb532a994ba6d38d5872166cee5d734b632164c2c" "4f7a687093ddd680a4d9c41555fece2b395cc41378c21a72d65411c4d2e4a4ef" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" default)))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (dot . t) (shell . t))))
 '(package-selected-packages
   (quote
    (scion chinese-pyim chinese-pyim-greatdict go-eldoc company-go helm-descbinds helm-systemd helm-projectile helm-ag helm popwin window-numbering yasnippet company-tern youdao-dictionary emmet-mode js2-mode tern web-beautify json-mode js-comint crux paradox shell-pop avy rainbow-mode smartparens projectile auto-compile git-timemachine deft org-pomodoro org-plus-contrib org-bullets evil-numbers evil-mc evil-leader evil-surround evil-nerd-commenter evil-magit spaceline ample-theme use-package)))
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
 '(bold ((t (:foreground "firebrick" :weight bold))))
 '(evil-mc-cursor-default-face ((t (:background "blue violet" :inverse-video nil))))
 '(italic ((t (:foreground "lime green" :slant italic))))
 '(org-code ((t (:inherit shadow :foreground "dark orange"))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-pomodoro-mode-line ((t (:foreground "dark red"))))
 '(sp-pair-overlay-face ((t nil)))
 '(spaceline-evil-emacs ((t (:background "#3A539B" :foreground "#D2D7D3" :inherit (quote mode-line)))))
 '(spaceline-evil-insert ((t (:background "YellowGreen" :foreground "#3E3D31" :inherit (quote mode-line)))))
 '(spaceline-evil-motion ((t (:background "#663399" :foreground "#D2D7D3" :inherit (quote mode-line))))))
