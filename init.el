(setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)

;; china mirror

;; (setq package-archives
;;       '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;; 	("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;; 	("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/" )))

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))

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
  (require 'use-package))

(use-package diminish :ensure t)

(use-package delight :ensure t)

;;Bootstrap `Org-mode' for parsing config file
(use-package org :ensure org-plus-contrib)

(setq custom-file "~/.emacs.d/custom.el")

(org-babel-load-file (concat user-emacs-directory "config.org"))
