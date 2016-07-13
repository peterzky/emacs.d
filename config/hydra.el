(use-package hydra
  :ensure t
  :config
  (defhydra hydra-mc ()
    "muti-cursor"
    ("n" evil-mc-make-and-goto-next-match "next")
    ("p" evil-mc-skip-and-goto-prev-cursor "previous")
    ("d" evil-mc-undo-all-cursors "delete all" :exit t)
    ("s" evil-mc-skip-and-goto-next-cursor "skip")
    )
  (evil-leader/set-key
    "m" 'hydra-mc/body)

  (defhydra hydra-nr (:exit t)
    "narrow state"
    ("r" narrow-to-region "region")
    ("n" narrow-to-region "region")
    ("w" peter/widen "widen")
    ("s" org-narrow-to-subtree "org tree")
    ("d" peter/narrow-to-defun "defun")
  )
  (evil-leader/set-key
    "n" 'hydra-nr/body)

  (defhydra hydra-frame ()
    ("z" make-frame "new frame")
    ("d" delete-frame"delete frame")
    ("n" other-frame "switch frame")
    )
  (evil-leader/set-key
    "z" 'hydra-frame/body)
)
