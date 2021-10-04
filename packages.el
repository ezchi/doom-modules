(setq ec/emacs-mirror-repos '("gcmh"
                           "shrink-path"
                           "undo-fu"
                           "undo-fu-session"
                           "git-timemachine"
                           "fish-completion"
                           "org-contrib"
                           "org-re-reveal"
                           "org-pretty-tags"
                           ))
(package! "gcmh"
  :recipe (:host github
           :repo "emacsmirror/gcmh"))
(package! "shrink-path"
  :recipe (:host github
           :repo "emacsmirror/shrink-path"))
(package! "undo-fu"
  :recipe (:host github
           :repo "emacsmirror/undo-fu"))
(package! "undo-fu-session"
  :recipe (:host github
           :repo "emacsmirror/undo-fu-session"))
(package! "git-timemachine"
  :recipe (:host github
           :repo "emacsmirror/git-timemachine"))
(package! "fish-completion"
  :recipe (:host github
           :repo "emacsmirror/fish-completion"))
(package! "org-contrib"
  :recipe (:host github
           :repo "emacsmirror/org-contrib"))
(package! "org-re-reveal"
  :recipe (:host github
           :repo "emacsmirror/org-re-reveal"))
(package! "org-pretty-tags"
  :recipe (:host github
           :repo "emacsmirror/org-pretty-tags"))


(package! evil-escape :disable t)

(package! graphviz-dot-mode
  :recipe (:host github
           :repo "ppareit/graphviz-dot-mode"))
           ;; :files ("graphviz-dot-mode.el")))

;; (package! compnay-graphviz-dot
;;   :recipe (:host github
;;            :repo "ppareit/graphviz-dot-mode"
;;            :files ("company-graphviz-dot.el")))

;; (package! org-mru-clock)

(package! org-pretty-tags)

;; (package! valign
;;   :recipe (:host github
;;            :repo "casouri/valign"))

(package! ob-http
  :recipe (:host github
           :repo "zweifisch/ob-http"))

(package! org-super-agenda)

(package! doct
  :recipe (:host github :repo "progfolio/doct"))

(package! org-roam-server)

(when IS-MAC
  (package! roam-block
    :recipe (:host github
             :repo "Kinneyzhang/roam-block")))

(package! org-edna)

(package! yasnippets-org
  :recipe (:host github
           :repo "ezchi/yasnippets-org"
           :files ("*.el" ("snippets" ("org-mode" "snippets/org-mode/*")))))

(package! org-gcal)

(package! org-ql)

(package! vhdl-mode
  :recipe (:host github
           :repo "ezchi/vhdl-mode"
           :branch "ec-release"))

(package! yasnippets-vhdl
  :recipe (:host github
           :repo "ezchi/yasnippets-vhdl"
           :files ("*.el" ("snippets" ("vhdl-mode" "snippets/vhdl-mode/*")))))

(package! verilog-mode
  :recipe (:host github
           :repo "ezchi/verilog-mode"
           :branch "indent-argument"
           :files ("verilog-mode.el")
           :nonrecursive t))

(package! yasnippets-verilog
  :recipe (:host github
           :repo "ezchi/yasnippets-verilog"
           :files ("*.el" ("snippets" ("verilog-mode" "snippets/verilog-mode/*")))))

(package! counsel-fd
  :recipe (:host github
           :repo "ezchi/counsel-fd"
           :branch "develop"))

(package! lorem-ipsum)

(package! slack
  :recipe (:host github
           :repo "yuya373/emacs-slack"))

(package! ec-elisp-dumpground
  :recipe (:host github
           :repo "ezchi/ec-elisp-dumpground"))

(package! ecdate
  :recipe (:host github
           :repo "ezchi/ecdate"))

(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))

(package! rg)

(package! promise)

(package! iter2)

(package! async-await)
