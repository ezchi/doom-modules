;;; vhdlplus/config.el -*- lexical-binding: t; -*-

(after! vhdl-mode
  (after! lsp
    (lsp-register-client
     (make-lsp-client :new-connection (lsp-stdio-connection
                                       (lambda () (cons "vhdl-tool" '("lsp"))))
                      :major-modes '(vhdl-mode)
                      :priority 0
                      :server-id 'vhdl-ls))

    (add-to-list 'lsp-language-id-configuration '(vhdl-mode . "vhdl"))
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
