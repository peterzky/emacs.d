(use-package youdao-dictionary
  :ensure t
  :config
  (evil-leader/set-key
    "oo" 'youdao-dictionary-search-at-point+))

(use-package fcitx
  :ensure t
  :config
  (fcitx-default-setup))
