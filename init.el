;;; Package --- Summary
;;; Commentary:
;;; init.el
;;; Code:
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

(setq custom-file "~/.emacs.d/config/custom.el")

(load custom-file)

(defvar peter/config-path "~/.emacs.d/config/")


(defvar peter/config-files (list
			    'global
			    'window
			    'function
			    'hydra
			    'completion
			    'smartparens
			    'misc
			    'evil
			    'vc
			    'ui
			    'org
			    'chinese
			    'helm
			    'mail
			    ;; 'feed
			    ;; 'festival
			    ;; 'sml
			    'elisp
			    'haskell
			    'golang
			    'octave
			    'javascript
			    ))

(mapc 'load (mapcar
	     (lambda (name)
	       (concat peter/config-path name))
	     (mapcar 'symbol-name peter/config-files)))

