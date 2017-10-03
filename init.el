(setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("melpa" . "http://elpa.emacs-china.org/melpa/")
	("org" . "http://elpa.emacs-china.org/org/")
	("gnu" . "http://elpa.emacs-china.org/gnu/" )))

(package-initialize)


;;Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'org)
  (package-refresh-contents)
  (package-install 'org))

(unless (package-installed-p 'org-plus-contrib)
  (package-refresh-contents)
  (package-install 'org-plus-contrib))

(eval-when-compile
  (require 'use-package)
  (require 'diminish)
  (require 'bind-key))

;;Bootstrap `Org-mode' for parsing config file
(use-package org :ensure org-plus-contrib)

(setq custom-file "~/.emacs.d/custom.el")

(org-babel-load-file (concat user-emacs-directory "config.org"))
