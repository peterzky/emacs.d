(define-key ibuffer-mode-map "j" #'ibuffer-forward-line)

(define-key ibuffer-mode-map "k" #'ibuffer-backward-line)

(defun peter/ibuffer-toggle ()
  (interactive)
  (if (equal
       (symbol-name (buffer-local-value 'major-mode (current-buffer))) "ibuffer-mode")
      (quit-window)
    (ibuffer)))

;; (global-set-key (kbd "M-<tab>") 'peter/ibuffer-toggle)

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


(use-package bookmark+
  :ensure t
  :config
  (evil-set-initial-state 'bookmark-bmenu-mode 'emacs)
  (define-key bookmark-bmenu-mode-map "j" #'next-line)
  (define-key bookmark-bmenu-mode-map "k" #'previous-line)
  (evil-leader/set-key
      "ll" 'bookmark-bmenu-list
      "lm" 'bookmark-set))
