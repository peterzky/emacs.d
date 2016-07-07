(use-package youdao-dictionary
  :ensure t
  :config
  (evil-leader/set-key
    "oo" 'youdao-dictionary-search-at-point+))

(use-package chinese-pyim-greatdict
  :ensure t)

(use-package chinese-pyim
  :ensure t
  :config
  (chinese-pyim-greatdict-enable)
  (setq pyim-use-tooltip 'popup)
  (setq pyim-enable-words-predict nil))

(setq default-input-method "chinese-pyim")
(global-set-key (kbd "C-\\") 'toggle-input-method)

(use-package chinese-fonts-setup
  :ensure t
  :config) 
