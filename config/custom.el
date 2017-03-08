(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method (quote pushy))
 '(package-selected-packages
   (quote
    (youdao-dictionary yasnippet window-numbering web-beautify use-package tablist systemd spaceline smartparens shm shell-pop scion ranger rainbow-mode rainbow-delimiters popwin paredit paradox org-pomodoro org-plus-contrib org-bullets json-mode js2-mode js-comint ivy info+ htmlize hindent helm-systemd helm-projectile helm-descbinds helm-ag gorepl-mode go-playground go-eldoc git-timemachine git-gutter flycheck-gometalinter fcitx expand-region evil-surround evil-numbers evil-nerd-commenter evil-mu4e evil-mc evil-magit evil-leader emmet-mode deft dashboard crux company-tern company-go company-ghc avy auto-compile ample-theme)))
 '(popwin:special-display-config
   (quote
    (help-mode
     ("*Gofmt Errors*" :position bottom)
     ("*HS-Error*" :position bottom)
     (" *undo-tree Diff*" :position bottom)
     (" *undo-tree*" :position bottom)
     ("*Youdao Dictionary*" :regexp nil)
     ("*Warnings*" :regexp nil)
     ("*Backtrace*" :regexp nil)
     ("*Miniedit Help*" :noselect t)
     (completion-list-mode :noselect t)
     (compilation-mode :noselect t)
     (grep-mode :noselect t)
     (occur-mode :noselect t)
     ("*Pp Macroexpand Output*" :noselect t)
     "*Shell Command Output*" "*vc-diff*" "*vc-change-log*"
     (" *undo-tree*" :width 60 :position right)
     ("^\\*anything.*\\*$" :regexp t)
     "*slime-apropos*" "*slime-macroexpansion*" "*slime-description*"
     ("*slime-compilation*" :noselect t)
     "*slime-xref*"
     (sldb-mode :stick t)
     slime-repl-mode slime-connection-list-mode)))
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
 '(bold ((t (:foreground "firebrick" :weight bold))))
 '(evil-mc-cursor-default-face ((t (:background "blue violet" :inverse-video nil))))
 '(hl-line ((t (:background "dim gray" :foreground "black"))))
 '(info-quoted-name ((t (:inherit font-lock-string-face :foreground "DarkOrange2"))))
 '(info-single-quote ((t (:inherit font-lock-keyword-face :foreground "dark violet"))))
 '(italic ((t (:foreground "peru" :slant italic))))
 '(org-block ((t (:inherit default))))
 '(org-code ((t (:inherit shadow :foreground "dark orange"))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-pomodoro-mode-line ((t (:foreground "dark red"))))
 '(sp-pair-overlay-face ((t nil)))
 '(spaceline-evil-emacs ((t (:background "#3A539B" :foreground "#D2D7D3" :inherit (quote mode-line)))))
 '(spaceline-evil-insert ((t (:background "YellowGreen" :foreground "#3E3D31" :inherit (quote mode-line)))))
 '(spaceline-evil-motion ((t (:background "#663399" :foreground "#D2D7D3" :inherit (quote mode-line))))))
