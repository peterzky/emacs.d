(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method (quote pushy))
 '(godoc-at-point-function (quote godoc-gogetdoc))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (dot . t) (shell . t))))
 '(package-selected-packages
   (quote
    (flycheck-gometalinter systemd youdao-dictionary yasnippet window-numbering web-beautify use-package spaceline smartparens shell-pop scion rainbow-mode pp-c-l popwin paradox org-pomodoro org-plus-contrib org-bullets json-mode js2-mode js-comint hungry-delete helm-systemd helm-projectile helm-descbinds helm-ag haskell-mode graphviz-dot-mode go-eldoc git-timemachine fcitx expand-region evil-surround evil-numbers evil-nerd-commenter evil-mc evil-magit evil-leader emmet-mode deft crux company-tern company-go chinese-pyim-greatdict chinese-pyim avy auto-compile ample-theme)))
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
 '(italic ((t (:foreground "peru" :slant italic))))
 '(org-code ((t (:inherit shadow :foreground "dark orange"))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-pomodoro-mode-line ((t (:foreground "dark red"))))
 '(sp-pair-overlay-face ((t nil)))
 '(spaceline-evil-emacs ((t (:background "#3A539B" :foreground "#D2D7D3" :inherit (quote mode-line)))))
 '(spaceline-evil-insert ((t (:background "YellowGreen" :foreground "#3E3D31" :inherit (quote mode-line)))))
 '(spaceline-evil-motion ((t (:background "#663399" :foreground "#D2D7D3" :inherit (quote mode-line))))))
