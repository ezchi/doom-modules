;;; private-tool/git/config.el -*- lexical-binding: t; -*-

(use-package! git-auto-commit-mode
  :commands (git-auto-commit-mode)
  :config
  (setq gac-debounce-interval 3600))
