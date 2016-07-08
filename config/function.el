
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


(defun peter/compile-init ()
  "Byte-compile all your dotfiles."
  (interactive)
  (byte-recompile-directory "~/.emacs.d/config" 0))

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
