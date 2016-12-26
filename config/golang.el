(use-package company-go
  :ensure t
  :init
  (progn
    (setq company-go-show-annotation nil)))

(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook (lambda ()
  			    (set (make-local-variable 'company-backends) '(company-go))
  			    (company-mode))))

;; (defun peter/godoc-at-point (old-function &rest arguments)
;;   (apply old-function arguments)
;;   (other-window 1))

;; (advice-add 'godoc-at-point :around #'peter/godoc-at-point)
;; (advice-add 'godoc :after #'other-window)
;; (add-function :after (godoc-at-point point) #'peter/other-window)

(evil-define-key 'normal go-mode-map (kbd "gd") 'godoc-at-point)
(evil-define-key 'normal go-mode-map (kbd "g=") 'gofmt)

(setq exec-path (append exec-path '("/home/peterzky/golang/bin")))