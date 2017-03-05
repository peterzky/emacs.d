
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

(defun peter/open-config-folder ()
  "open config folder"
  (interactive)
  (find-file "~/.emacs.d/config/"))

(defun peter/open-note-file ()
  "open notes.org"
  (interactive)
  (find-file "~/btsync/capture.org"))

(defun peter/recompile-all-packages ()
  (interactive)
  (byte-recompile-directory package-user-dir nil 'force))

;; (defadvice find-file (after find-file-sudo activate)
;;   "Find file as root if necessary"
;;   (unless (and buffer-file-name
;; 	       (file-writable-p buffer-file-name))
;; (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; (defun peter/helm-sudo-find-file (orig-fun &rest args)
;;   "find file auto sudo"
;;   (if (file-writable-p (helm-get-selection))
;;       (apply orig-fun args)
;;     (helm-find-file-as-root (helm-get-selection))))

;; (advice-add 'helm-maybe-exit-minibuffer :around #'peter/helm-sudo-find-file)

;; close window after kill buffer command
(advice-add 'kill-this-buffer :after #'delete-window)

(defun peter/compile-init ()
  "Byte-compile all your dotfiles."
  (interactive)
  (byte-compile-file "~/.emacs.d/init.el")
  (byte-recompile-directory "~/.emacs.d/config" 0)
  (byte-recompile-directory "~/.emacs.d/theme" 0))

(defun peter/split-vertically ()
  "Split window vertically and focus"
  (interactive)
  (split-window-vertically)
  (other-window 1))

(defun peter/split-horizontally ()
  "Split window horizontally and focus"
  (interactive)
  (split-window-horizontally)
  (other-window 1))

(defun peter/widen ()
  "after widen scroll down"
  (interactive)
  (widen)
  (scroll-down 8))

(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;ERC
(setq socks-server
      (list "My socks server" "localhost" 1080 5))
(setq socks-noproxy '("localhost"))

(require 'socks)
(setq erc-server-connect-function 'socks-open-network-stream)

(defun peter/narrow-to-defun ()
  "narrow function depanding on mode"
  (interactive)
  (let ((current-mode (message "%s" major-mode)))
    (cond
     ((or (equal current-mode "emacs-lisp-mode")
	  (equal current-mode "lisp-interaction-mode"))
      ( narrow-to-defun ))
     ((or (equal current-mode "js2-mode")
	  (equal current-mode "js2-jsx-mode")
	  )
      ( js2-narrow-to-defun )))))




