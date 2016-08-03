(use-package sml-mode
    :ensure t
    :config
    )

(setenv "PATH" (concat (getenv "PATH") ":/home/peterzky/playground/smlnj/bin"))
(setq exec-path (append exec-path '("/home/peterzky/playground/smlnj/bin")))
