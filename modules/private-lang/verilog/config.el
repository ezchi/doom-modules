;;; private-lang/verilog/config.el -*- lexical-binding: t; -*-

(use-package! verilog-mode
  :defer t
  :mode "\\.[s]?v[h]?\\'"
  :config
;;  (add-hook 'verilog-mode-hook '(lambda()
;;                                  ;; Do not automatically insert "'" pair : 1'b0 -> 1'b0'
;;                                  (sp-local-pair 'verilog-mode "'" nil :actions nil)
;;
;;                                  ;; Use space for indent
;;                                  (setq-default indent-tabs-mode nil)))

  (setq verilog-align-ifelse nil)
  (setq verilog-auto-indent-on-newline t)
  (setq verilog-auto-lineup 'assignments)
  (setq verilog-auto-newline nil)
  (setq verilog-case-indent 4)
  (setq verilog-cexp-indent 0)
  (setq verilog-debug t)
  (setq verilog-highlight-grouping-keywords t)
  (setq verilog-highlight-includes t)
  (setq verilog-highlight-modules t)
  (setq verilog-highlight-translate-off t)
  (setq verilog-indent-begin-after-if nil)
  (setq verilog-indent-declaration-macros nil)
  (setq verilog-indent-level 4)
  (setq verilog-indent-level-behavioral 4)
  (setq verilog-indent-level-declaration 4)
  (setq verilog-indent-level-module 4)
  (setq verilog-indent-lists t)
  (setq verilog-library-extensions '(".v" ".sv" ".svh"))
  (setq verilog-minimum-comment-distance 40)
  (setq verilog-tab-always-indent t)
  (setq verilog-typedef-regexp "_t$"))

(use-package yasnippets-verilog)
