(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
    '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
   (package-refresh-contents)
     (package-install 'use-package))

(setq auto-save-default nil)

(menu-bar-mode -1)

(tool-bar-mode -1)

;; help window auto-focus
(setq help-window-select t) 

(scroll-bar-mode -1)

(add-to-list 'default-frame-alist
	     '(font . "Bitstream Vera Sans Mono-11"))

(defun peter/switch-buffer ()
  "switch to last buffer"
  (interactive)
  (if (evil-alternate-buffer)
      (switch-to-buffer (car (evil-alternate-buffer)))
    (switch-to-buffer (other-buffer (current-buffer) t))))

(defun peter/edit-config-file ()
  "edit config file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun peter/open-note-file ()
  "open notes.org"
  (interactive)
  (find-file "~/btsync/notes.org"))


(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary"
  (unless (and buffer-file-name
	       (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(use-package avy
  :ensure t)

(use-package ample-theme
  :ensure t
  :config
  (load-theme 'ample t))

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))
  

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  )

(use-package evil-nerd-commenter
  :ensure t)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-leader
  :ensure t
  :config
  (setq evil-leader/in-all-states t)
  (global-evil-leader-mode 1)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "bb" 'switch-to-buffer
    "bd" 'kill-this-buffer
    "fs" 'save-buffer
    "ff" 'find-file
    "gg" 'gist-list
    "nn" 'peter/open-note-file
    "qq" 'save-buffers-kill-emacs
    "ws" 'split-window-below
    "wv" 'split-window-right
    "ww" 'delete-window
    "ae" 'deft
    "fed" 'peter/edit-config-file
    "zz" 'delete-frame
    "cl" 'evilnc-comment-or-uncomment-lines
    "'" 'shell-pop
    "s" 'swiper
    "SPC" 'avy-goto-char-2
    "ESC" 'delete-other-windows
    "TAB" 'peter/switch-buffer)
  )

(use-package company-tern
  :ensure t)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-to-list 'company-backends 'company-tern)
  )

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  )

(defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))

(defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas/minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))

(global-set-key [tab] 'tab-indent-or-complete)

(use-package ranger
  :ensure t
  :config
  (evil-leader/set-key
    "ar" 'ranger)
  )

(use-package magit
  :ensure t
  :config
  (evil-leader/set-key
    "gs" 'magit-status)
  )

(use-package evil-magit
  :ensure t
  )

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (add-to-list 'projectile-globally-ignored-directories "node_modules") 
  (evil-leader/set-key
    "pp" 'projectile-switch-project
    "pf" 'projectile-find-file)
  )

(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode)
  (evil-leader/set-key
    "1" 'select-window-1
    "2" 'select-window-2
    "3" 'select-window-3
    "4" 'select-window-4
    "5" 'select-window-5
    "6" 'select-window-6
    "7" 'select-window-7
    "8" 'select-window-8
    "9" 'select-window-9
    "0" 'select-window-0)
  )

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  (add-hook 'js2-mode-hook #'smartparens-mode)
  )

(use-package smex
  :ensure t
  :bind ("s-x" . smex))


(use-package swiper
  :ensure t)

(use-package shell-pop
  :ensure t
  :config
  (setq shell-pop-shell-type
	(quote ("ansi-term" "*ansi-term*"
		(lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/bin/zsh")
  (setq shell-pop-full-span t))

(use-package paradox
  :ensure t
  :config
  (setq paradox-github-token t))

(use-package youdao-dictionary
  :ensure t
  :config
  (evil-leader/set-key
    "oo" 'youdao-dictionary-search-at-point+))

(use-package tern
  :ensure t)

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :interpreter "node"
  :config
  (add-hook 'js2-mode-hook (lambda () (tern-mode t))))

(use-package org
  :ensure t
  :bind ("\C-cc". org-capture)
  :config
  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-open-at-point)
  (setq org-log-done 'time)
  (setq org-src-fontify-natively t)
  (setq org-startup-folded nil)
  )

(use-package org-bullets
  :ensure t
  )

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package org-plus-contrib
  :ensure t
  :config
  )

(use-package deft
  :ensure t
  :config
  (setq deft-extensions '("org"))
  (setq deft-directory "~/btsync/notes")
  )

(use-package emmet-mode
  :ensure t
  :bind ("C-tab" . emmet-expand) 
  :config
  )

(add-hook 'html-mode 'emmet-mode)
(add-hook 'js2-jsx-mode 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))

;;jsx mode  
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
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
