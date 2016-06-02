(setq auto-save-default nil)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)


(require 'package)

; List the packages you want
(setq package-list '(evil
		     window-numbering
		     js2-mode
		     tern
		     tern-auto-complete
		     org
		     evil-nerd-commenter
		     ample-theme
		     org-plus-contrib
                     evil-leader
		     auto-complete
		     ranger
		     magit
		     evil-magit
		     paradox
		     shell-pop
		     projectile
		     ido-vertical-mode
		     smex
		     org-bullets
		     deft
		     youdao-dictionary
		     smartparens
		     ))

; Add Melpa as the default Emacs Package repository
; only contains a very limited number of packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t) 
(add-to-list 'package-archives 
             '("org" . "http://orgmode.org/elpa/") t)
; Activate all the packages (in particular autoloads)
(package-initialize)

; Update your local package index
(unless package-archive-contents
  (package-refresh-contents))

; Install all missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(load-theme 'ample t)

(require 'evil)
(require 'evil-nerd-commenter)
(require 'evil-leader)

(evil-mode 1)

;; insert state in emacs keybinding
(setq evil-insert-state-map (make-sparse-keymap))
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

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

(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary"
  (unless (and buffer-file-name
	       (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun peter/delete-buffer-file ()
  "delete current file"
  (interactive)
  (dired-delete-file (buffer-file-name))
  (kill-this-buffer))

(setq evil-leader/in-all-states t)
(global-evil-leader-mode 1)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "bb" 'switch-to-buffer
  "bd" 'kill-this-buffer
  "fs" 'save-buffer
  "ff" 'find-file
  ;; "fd" 'peter/delete-buffer-file
  "qq" 'save-buffers-kill-emacs
  "ws" 'split-window-below
  "wv" 'split-window-right
  "wd" 'delete-window
  "ae" 'deft
  "fed" 'peter/edit-config-file
  "zz" 'delete-frame
  "cl" 'evilnc-comment-or-uncomment-lines
  "'" 'shell-pop
  "ESC" 'delete-other-windows
  "TAB" 'peter/switch-buffer)


(require 'auto-complete)
(ac-config-default)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; (require 'yasnippet)
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

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
(ido-everywhere 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)



(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-src-fontify-natively t)


(require 'smex)
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "s-X") 'smex-major-mode-commands)

(require 'window-numbering)
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
  "0" 'select-window-0
  )

 
(setq deft-extensions '("org"))
(setq shell-pop-shell-type
      (quote ("ansi-term" "*ansi-term*"
	      (lambda nil (ansi-term shell-pop-term-shell)))))
(setq shell-pop-term-shell "/bin/zsh")


(require 'youdao-dictionary)
(evil-leader/set-key
  "oo" 'youdao-dictionary-search-at-point+
  "op" 'youdao-dictionary-play-voice-at-point)

(require 'smartparens)
(add-hook 'emacs-lisp-mode #'smartparens-mode)
(add-hook 'js2-mode #'smartparens-mode)

 
(require 'js2-mode)
(require 'tern)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#504545" "#ad8572" "#a9df90" "#aaca86" "#91a0b3" "#ab85a3" "#ddbc91" "#bdbdb3"])
 '(ansi-term-color-vector
   [unspecified "#424242" "#EF9A9A" "#C5E1A5" "#FFEE58" "#64B5F6" "#E1BEE7" "#80DEEA" "#E0E0E0"])
 '(beacon-color "#ec4780")
 '(custom-safe-themes
   (quote
    ("4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "5999e12c8070b9090a2a1bbcd02ec28906e150bb2cdce5ace4f965c76cf30476" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" default)))
 '(evil-emacs-state-cursor (quote ("#E57373" bar)) t)
 '(evil-insert-state-cursor (quote ("#E57373" hbar)) t)
 '(evil-normal-state-cursor (quote ("#FFEE58" box)) t)
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)) t)
 '(highlight-symbol-colors
   (quote
    ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors (quote (("#ec4780" . 0) ("#424242" . 100))))
 '(paradox-github-token t)
 '(pos-tip-background-color "#3a3a3a")
 '(pos-tip-foreground-color "#9E9E9E")
 '(tabbar-background-color "#353535"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :foreground "dark cyan" :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0)))))
