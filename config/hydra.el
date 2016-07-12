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
    "m" 'hydra-mc/body)

  (defhydra hydra-nr ()
    "narrow state"
    ("n" narrow-to-region "region")
    ("w" widen "widen")
  )
  (evil-leader/set-key
    "n" 'hydra-nr/body)

)
