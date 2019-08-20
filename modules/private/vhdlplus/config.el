;;; vhdlplus/config.el -*- lexical-binding: t; -*-

(require 'lsp)
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection
                                   (lambda () (cons "vhdl-tool" '("lsp"))))
                  :major-modes '(vhdl-mode)
                  :priority 0
                  :server-id 'vhdl-ls))

(add-hook 'vhdl-mode-hook #'lsp)
(add-to-list 'lsp-language-id-configuration '(vhdl-mode . "vhdl"))
