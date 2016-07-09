;; ibuffer

(define-key ibuffer-mode-map "j" #'ibuffer-forward-line)

(define-key ibuffer-mode-map "k" #'ibuffer-backward-line)

(defun peter/ibuffer-toggle ()
  (interactive)
  (if (equal
       (symbol-name (buffer-local-value 'major-mode (current-buffer))) "ibuffer-mode")
      (quit-window)
    (ibuffer)))

(global-set-key (kbd "M-<tab>") 'peter/ibuffer-toggle)

;;disable ibuffer prompt
(setq ibuffer-expert t)

(setq ibuffer-show-empty-filter-groups nil)

(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("rss" (name . "^\\*elfeed-.*\\*$"))
	       ("erc" (mode . erc-mode))
	       ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")
			 (mode . emacs-lisp-mode)))))))

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 100000) (format "%7.0fk" (/ (buffer-size) 1000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))

;; Modify the default ibuffer-formats
  (setq ibuffer-formats
	'((mark modified read-only " "
		(name 18 18 :left :elide)
		" "
		(size-h 9 -1 :right)
		" "
		(mode 16 16 :left :elide)
		" "
		filename-and-process)))

(add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "default")))
		   
(use-package avy
  :ensure t
  :config
  (evil-leader/set-key
    "SPC" 'avy-goto-char-2))

(use-package ido-vertical-mode
  :ensure t
  :config
  (setq ido-enable-flex-matching t)
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode 1)) 

(use-package helm-swoop
    :ensure t
    :config
    (evil-leader/set-key
      "s" 'helm-swoop))

(use-package helm-ag
  :ensure t
  :config
  (evil-leader/set-key
    "ag" 'helm-ag
    "ap" 'helm-ag-project-root))

(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode)
  (global-set-key (kbd "<f3>") 'next-buffer)
  (global-set-key (kbd "<f2>") 'previous-buffer)
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


(use-package shell-pop
  :ensure t
  :config
  (global-set-key (kbd "<f1>") 'shell-pop)
  (setq shell-pop-full-span t))

(defalias 'open 'find-file-other-window)

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))

(use-package paradox
  :ensure t
  :config
  (setq paradox-github-token t)
  (evil-set-initial-state 'paradox-menu-mode 'emacs)
  (evil-leader/set-key
    "pr" 'paradox-list-packages))


(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "s-x") 'smex))

(use-package bookmark+
  :ensure t
  :config
  (evil-set-initial-state 'bookmark-bmenu-mode 'emacs)
  (define-key bookmark-bmenu-mode-map "j" #'next-line)
  (define-key bookmark-bmenu-mode-map "k" #'previous-line)
  (evil-leader/set-key
      "ll" 'bookmark-bmenu-list
      "lm" 'bookmark-set))

