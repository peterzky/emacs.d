(require 'org)
(require 'ivy)
(require 'counsel)

;;; Code:
(defvar wiki-location "/home/peterzky/playground/org-testing/")

(org-link-set-parameters "wiki" :follow 'wiki-open)

(defun wiki-file (page-name)
  (concat wiki-location page-name ".org"))

(defun wiki-open (page-name)
  (let ((file (wiki-file page-name)))
    (if (not (file-exists-p file))
	(progn (find-file file)
	       (wiki-header)
	       (save-buffer))
      (find-file file))))

(defun wiki-rename ()
  (interactive)
  (let* ((remove)
         (desc)
         (link)
         (old-file)
         (new-file)
         (new-name))
    (when (org-in-regexp org-bracket-link-regexp 1)
      (setq remove (list (match-beginning 0) (match-end 0)))
      (setq desc (when (match-end 3) (match-string-no-properties 3)))
      (setq new-name (read-string "Rename: " desc))
      (setq old-file (expand-file-name (concat wiki-location desc ".org")))
      (setq new-file (expand-file-name (concat wiki-location new-name ".org")))
      (rename-file old-file new-file)
      (apply 'delete-region remove)
      (insert (org-make-link-string (concat "wiki:" new-name) new-name))
      ;; redisplay
      (sit-for 0)
      )))

(defun wiki-create ()
  "Create a new org-wiki page asking the user its name."
  (interactive)
  (let ((page-name (read-string  "Page: ")))
    (save-excursion
      (insert (org-make-link-string
	       (concat "wiki:" page-name)
	       page-name)))))

(defun wiki-ivy-selection (callback)
  "Open a helm menu to select the wiki page and invokes the CALLBACK function."
  (ivy-read "Wiki Pages: "
	    (delete-dups (wiki-page-list))
	    :action callback  ))


(defun wiki-insert ()
  "Insert file with ivy."
  (interactive)
  (save-mark-and-excursion
   (wiki-ivy-selection
    (lambda (page) (insert (wiki-make-link page))))))

(defun wiki-goto ()
  "Go to file with ivy."
  (interactive)
  (save-mark-and-excursion
   (wiki-ivy-selection
    (lambda (page) (wiki-open page)))))

(defun wiki-search ()
  (interactive)
  (counsel-ag nil wiki-location nil "wiki search: "))

(defun wiki-make-link (page-name)
  (format "[[wiki:%s][%s]]" page-name page-name))

(defun wiki-file-list ()
  (mapcar (lambda (page)
	    (concat wiki-location page ".org"))
	  (wiki-page-list)))

(defun wiki-page-list ()
  (mapcar (lambda (n) (file-name-base n))
	  (cl-remove-if-not
	   (lambda (s)
	     (and (string-suffix-p ".org" s)
		  (not (string-prefix-p ".#" s))))
	   (directory-files wiki-location))))


(defun wiki-header ()
  (interactive)
  (save-mark-and-excursion
   (goto-char (point-min))
   (insert (format
	    (string-trim "
#+TITLE: %s
#+DESCRIPTION:
#+KEYWORDS:
#+STARTUP: overview
#+CATEGORY: WIKI

Related: [[wiki:index][Index]]")
	    (file-name-base (buffer-file-name))))))


(provide 'wiki)
;;; wiki.el ends here
