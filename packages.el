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
(package! yasnippets-vhdl :recipe (:host github :repo "ezchi/yasnippets-vhdl" :files ("*.el" ("snippets" ("vhdl-mode" "snippets/vhdl-mode/*")))))

;;
;; Verilog
;;
(package! verilog-mode       :recipe (:host github :repo "ezchi/verilog-mode" :branch "lite"))
(package! yasnippets-verilog :recipe (:host github :repo "ezchi/yasnippets-verilog" :files ("*.el" ("snippets" ("verilog-mode" "snippets/verilog-mode/*")))))

;;
;; Org
;;
(package! ob-http :recipe (:host github :repo "zweifisch/ob-http"))


;; Tools
;; Search
(package! rg)

;; Terminal
(package! multi-vterm)

(package! ecdate :recipe (:host github :repo "ezchi/ecdate"))
