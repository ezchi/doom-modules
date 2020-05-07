;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Org
(after! org
  (setq org-log-into-drawer t)
  (setq org-log-state-notes-into-drawer t))

;; Keybindings
(map!
 :n "SPC c l" #'evilnc-comment-or-uncomment-lines)
