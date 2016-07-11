(fset 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)

(tool-bar-mode -1)

;; help window auto-focus
(setq help-window-select t) 

(scroll-bar-mode -1)

(add-to-list 'default-frame-alist
	     '(font . "Bitstream Vera Sans Mono-11"))
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

(use-package ample-theme
  :ensure t
  :config
  (load-theme 'ample t))

(setq custom-file "~/.emacs.d/config/custom.el")

(load custom-file)

(defvar peter/config-path "~/.emacs.d/config/")


(defvar peter/config-files (list
			    'function
			    'evil
			    'org
			    'misc
			    'interface
			    'javascript
			    'chinese
			    'completion
			    'window
			    'helm
			    'mail
			    'festival
			    ))

(mapc 'load (mapcar
	     (lambda (name)
	  (concat peter/config-path name))
	     (mapcar 'symbol-name peter/config-files)))
