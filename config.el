;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; Fonts
(if IS-MAC
    (setq doom-font (font-spec :family "Go Mono for Powerline" :size 12))
  (setq doom-font (font-spec :family "Go Mono for Powerline" :size 22)))

(setq display-time-day-and-date t)
(display-time-mode t)

;; Org
(after! org
  (setq org-log-into-drawer t)
  (setq org-log-state-notes-into-drawer t))


;; keybindings
(setq doom-localleader-key ",")

(map!
 :n "SPC t D" #'toggle-debug-on-errorg)

(setq which-key-idle-delay 0.5)
