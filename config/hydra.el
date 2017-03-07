(use-package hydra
  :ensure t
  :config
  (defhydra hydra-mc ()
    "muti-cursor"
    ("n" evil-mc-make-and-goto-next-match "next")
    ("p" evil-mc-skip-and-goto-prev-cursor "previous")
    ("d" evil-mc-undo-all-cursors "delete all" :exit t)
    ("s" evil-mc-skip-and-goto-next-cursor "skip"))

  (evil-leader/set-key
    "m" 'hydra-mc/body)

  (defhydra hydra-nr (:exit t)
    "narrow state"
    ("r" narrow-to-region "region")
    ("n" narrow-to-region "region")
    ("w" peter/widen "widen")
    ("s" org-narrow-to-subtree "org tree")
    ("d" peter/narrow-to-defun "defun"))

  (evil-leader/set-key
    "n" 'hydra-nr/body)

  (defhydra hydra-frame ()
    ("d" make-frame "new frame")
    ("z" delete-frame"delete frame")
    ("n" other-frame "switch frame"))

  (evil-leader/set-key
    "z" 'hydra-frame/body)

  (defhydra hydra-window-resize ()
    ("j" shrink-window "down")
    ("k" enlarge-window "up")
    ("h" shrink-window-horizontally "left")
    ("l" enlarge-window-horizontally "right")
    ("=" balance-windows "balance"))

  (evil-leader/set-key
    "wr" 'hydra-window-resize/body)

  ;; hydra mode that not exit after other activites
  (defhydra hydra-artist-mode (:foreign-keys run)
    ("s" artist-select-op-straight-line "line" )
    ("r" artist-select-op-rectangle "rectangle")
    ("R" artist-select-op-square "squares")
    ("a" artist-select-op-poly-line "poly-lines")
    ("S" artist-select-op-straight-poly-line "straight poly-lines")
    ("e" artist-select-op-ellipse "drawing ellipses")
    ("c" artist-select-op-circle "drawing circles")
    ("y" artist-select-op-cut-rectangle "cutting rectangles")
    ("p" artist-select-op-copy-rectangle "copying rectangles")
    ("q" nil "quit"))
  (add-hook 'artist-mode-hook
	    (lambda ()
	      (local-set-key (kbd "C-c C-s") 'hydra-artist-mode/body)))
)

(defhydra hydra-smerge
  (:color red :hint nil
          :pre (smerge-mode 1))
  "
^Move^ ^Keep^ ^Diff^ ^Pair^
------------------------------------------------------
_n_ext _b_ase _R_efine _<_: base-mine
_p_rev _m_ine _E_diff _=_: mine-other
^ ^ _o_ther _C_ombine _>_: base-other
^ ^ _a_ll _r_esolve
_q_uit _RET_: current
"
  ("RET" smerge-keep-current)
  ("C" smerge-combine-with-next)
  ("E" smerge-ediff)
  ("R" smerge-refine)
  ("a" smerge-keep-all)
  ("b" smerge-keep-base)
  ("m" smerge-keep-mine)
  ("n" smerge-next)
  ("o" smerge-keep-other)
  ("p" smerge-prev)
  ("r" smerge-resolve)
  ("<" smerge-diff-base-mine)
  ("=" smerge-diff-mine-other)
  (">" smerge-diff-base-other)
  ("q" nil :color blue))
