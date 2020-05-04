;;; vhdlplus/config.el -*- lexical-binding: t; -*-

(after! vhdl-mode
  (after! lsp
    (add-hook 'vhdl-mode-hook #'lsp))
  (after! flycheck
    (flycheck-define-checker vhdl-tool
      "A VHDL syntax checker, type checker and linter using VHDL-Tool.
See `http://vhdltool.com'."
      :command ("vhdl-tool" "client" "lint" "--compact" source-inplace)
      :error-patterns
      ((warning line-start (file-name) ":" line ":" column ":w:" (message) line-end)
       (error line-start (file-name) ":" line ":" column ":e:" (message) line-end))
      :modes vhdl-mode)
    (add-to-list 'flycheck-checkers 'vhdl-tool)))
