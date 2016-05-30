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
  "fs" 'save-buffer
  "ff" 'find-file
  "qq" 'save-buffers-kill-emacs)

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

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)

