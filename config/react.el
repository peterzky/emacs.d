(use-package evil-matchit
  :ensure t
  :config
  )

(defun react/post-init-evil-matchit()
  (with-eval-after-load 'evil-matchit
    (plist-put evilmi-plugins 'react-mode '((evilmi-simple-get-tag evilmi simple-jump)
					    (evilmi-javascript-get-tag evilmi-javascript-jump)
					    (evilmi-html-get-tag evilmi-html-jump)))))


(use-package flycheck
  :ensure t
  :config
  (progn
      (flycheck-add-mode 'javascript-eslint 'react-mode)
      (defun react/disable-jshint ()
	(push 'javascript-jshint flycheck-disabled-checkers))
      (add-hook 'react-mode-hook #'react/disable-jshint))))



(defun react/post-init-js2-mode ()
  (add-hook 'react-mode-hook 'js2-minor-mode)
  )

(defun react/post-init-web-mode ()
  (define-derived-mode react-mode web-mode "react")
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . react-mode))
  (add-to-list 'auto-mode-alist '("\\.react.js\\'" . react-mode))
  (add-to-list 'auto-mode-alist '("\\index.android.js\\'" . react-mode))
  (add-to-list 'auto-mode-alist '("\\index.ios.js\\'" . react-mode))
  (add-to-list 'magic-mode-alist '("/\\*\\* @jsx React\\.DOM \\*/" . react-mode))
  (defun react/setup-react-mode ()
    "Adjust web-mode to accommodate react-mode"
    (emmet-mode 0)
    ;; See https://github.com/CestDiego/emmet-mode/commit/3f2904196e856d31b9c95794d2682c4c7365db23
    (setq-local emmet-expand-jsx-className? t)
    ;; Enable js-mode snippets
    (yas-activate-extra-mode 'js-mode)
    ;; Force jsx content type
    (web-mode-set-content-type "jsx")
    ;; Don't auto-quote attribute values
    (setq-local web-mode-enable-auto-quoting nil)
    ;; Why do we do this ?
    (defadvice web-mode-highlight-part (around tweak-jsx activate)
      (let ((web-mode-enable-part-face nil))
        ad-do-it)))
(add-hook 'react-mode-hook 'react/setup-react-mode))
