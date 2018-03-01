(require 'org)
(require 'ivy)
(require 'counsel)

;;; Code:
(defvar wiki-location "/home/peterzky/playground/org-testing/")

(org-add-link-type "wiki" 'wiki-open)

(defun wiki-file (page-name)
  (concat wiki-location page-name ".org"))

(defun wiki-open (page-name)
  (let ((file (wiki-file page-name)))
    (if (not (file-exists-p file))
	(progn (find-file file)
	       (wiki-header)
	       (save-buffer))
      (find-file file))))

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

Related: [[wiki:index][Index]]")
	    (file-name-base (buffer-file-name))))))


(provide 'wiki)
;;; wiki.el ends here
