;;; vhdlplus/config.el -*- lexical-binding: t; -*-

(after! vhdl-mode
  (after! lsp
    (lsp-register-client
     (make-lsp-client :new-connection (lsp-stdio-connection
                                       (lambda () (cons "vhdl-tool" '("lsp"))))
                      :major-modes '(vhdl-mode)
                      :priority 0
                      :server-id 'vhdl-ls))

    (add-to-list 'lsp-language-id-configuration '(vhdl-mode . "vhdl")))
  (add-hook 'vhdl-mode-hook #'lsp))
