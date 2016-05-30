(load-theme 'wombat)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)


(require 'package)

; List the packages you want
(setq package-list '(evil
                     evil-leader
		     auto-complete
		     ranger
		     magit
		     evil-magit
		     projectile
		     ido-vertical-mode
		     smex
		     org-bullets
		     deft
		     ))

; Add Melpa as the default Emacs Package repository
; only contains a very limited number of packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t) 
; Activate all the packages (in particular autoloads)
(package-initialize)

; Update your local package index
(unless package-archive-contents
  (package-refresh-contents))

; Install all missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil)
(evil-mode t)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "bb" 'switch-to-buffer
  "bd" 'kill-buffer
  "fs" 'save-buffer
  "ff" 'find-file
  "qq" 'save-buffers-kill-emacs
  "o" 'other-window
  "1" 'delete-other-windows)

(require 'auto-complete)
(ac-config-default)

(require 'ranger)
(evil-leader/set-key
  "ar" 'ranger)

(require 'magit)
(require 'evil-magit)

(evil-leader/set-key
  "gs" 'magit-status)

(require 'projectile)
(projectile-global-mode)
(evil-leader/set-key
  "pp" 'projectile-switch-project
  "pf" 'projectile-find-file)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-src-fontify-natively t)

;(require 'deft)
;(setq deft-extensions '("txt" "tex" "org"))
;(setq deft-directory "~/btsync/notes")

(require 'smex)
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "s-X") 'smex-major-mode-commands)
