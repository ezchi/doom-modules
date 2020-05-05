;; -*- no-byte-compile: t; -*-
;;; private-lang/verilog/packages.el

(package! verilog-mode
  :recipe (:host github :repo "ezchi/verilog-mode" :branch "lite"
           :files ("verilog-mode.el")))

(package! yasnippets-verilog
  :recipe (:host github :repo "ezchi/yasnippets-verilog" :branch "feature/optiver"
           :files ("*.el" ("snippets" ("verilog-mode" "snippets/verilog-mode/*")))))
