(use-package hydra
  :ensure t
  :config
  (defhydra hydra-mc ()
    "muti-cursor"
    ("n" evil-mc-make-and-goto-next-match "next")
    ("p" evil-mc-skip-and-goto-prev-cursor "previous")
    ("d" evil-mc-undo-all-cursors "delete all")
    ("s" evil-mc-skip-and-goto-next-cursor "skip")
    )
  (evil-leader/set-key
    "c" 'hydra-mc/body)
  )

