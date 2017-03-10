(setq load-prefer-newer t)

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

(eval-when-compile
  (require 'use-package)
  (require 'diminish)
  (require 'bind-key))

;; Bootstrap `Org-mode' for parsing config file
(use-package org
  :ensure t)

(use-package org-plus-contrib
  :ensure t)

(setq custom-file "~/.emacs.d/custom.el")

(org-babel-load-file (concat user-emacs-directory "config.org"))
