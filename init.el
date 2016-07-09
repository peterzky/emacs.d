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

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(if (eq system-type 'gnu/linux)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable"))

(fset 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)


(tool-bar-mode -1)

;; help window auto-focus
(setq help-window-select t) 

(scroll-bar-mode -1)

(add-to-list 'default-frame-alist
	     '(font . "Bitstream Vera Sans Mono-11"))

(use-package ample-theme
  :ensure t
  :config
  (load-theme 'ample t))

(setq custom-file "~/.emacs.d/config/custom.el")

(load custom-file)

(load "~/.emacs.d/config/function")

(load "~/.emacs.d/config/evil")

(load "~/.emacs.d/config/org")

(load "~/.emacs.d/config/misc")

(load "~/.emacs.d/config/interface")

(load "~/.emacs.d/config/javascript")

(load "~/.emacs.d/config/chinese")

(load "~/.emacs.d/config/completion")

(load "~/.emacs.d/config/mail")

