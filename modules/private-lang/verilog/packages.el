;; -*- no-byte-compile: t; -*-
;;; private-lang/verilog/packages.el

(package! verilog-mode :recipe (:host github :repo "ezchi/verilog-mode" :branch "develop"))
(package! yasnippets-verilog :recipe (:host github :repo "ezchi/yasnippets-verilog" :files ("*.el" ("snippets" ("verilog-mode" "snippets/verilog-mode/*")))))
