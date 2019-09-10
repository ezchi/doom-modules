;;; private-config/+bindings.el -*- lexical-binding: t; -*-

(map! :leader
      (:prefix "c"
        :desc "Toggle comment" "l" #'evil-commentary-line)

      :n "gzs" #'evil-mc-skip-and-goto-next-match
      :n "gzS" #'evil-mc-skip-and-goto-prev-match)
