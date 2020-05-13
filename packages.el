;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
;;

;;
;; Git
;;
(package! git-auto-commit-mode)

;;
;; VHDL
;;
(package! vhdl-mode :recipe (:host github :repo "ezchi/vhdl-mode" :branch "ec-release"))

;;
;; Verilog
;;
(package! verilog-mode       :recipe (:host github :repo "ezchi/verilog-mode" :branch "lite" :files ("verilog-mode.el")))
(package! yasnippets-verilog :recipe (:host github :repo "ezchi/yasnippets-verilog" :files ("*.el" ("snippets" ("verilog-mode" "snippets/verilog-mode/*")))))
