;;; private-lang/org/config.el -*- lexical-binding: t; -*-

(after! org
  ;; Property
  (setq
   org-use-property-inheritance t
   org-catch-invisible-edits 'smart
   )

  ;; Agenda
  (setq
   org-agenda-skip-scheduled-if-done t
   org-agenda-skip-deadline-if-done t
   )

  ;; Export
  (setq org-export-backends '(ascii html icalendar latex md odt pandoc pdf))

  ;; Log & Draw
  (setq
   org-log-done 'time
   org-log-repeat 'time
   org-log-redeadline 'note
   org-log-reschedule 'note
   )

  ;; Roam
  (when (featurep! +roam)
    (setq org-roam-directory (expand-file-name "roam" org-directory))
    (use-package! org-journal
      :bind
      ("SPC n j" . org-journal-new-entry)
      :custom
      (org-journal-dir org-roam-directory)
      (org-journal-date-prefix "#+TITLE: ")
      (org-journal-file-format "%Y-%m-%d.org")
      (org-journal-date-format "%A, %d %B %Y"))
    (setq org-journal-enable-agenda-integration t))

  ;; TODO
  (setq org-enforce-todo-checkbox-dependencies t)


;;  (setq org-babel-load-languages '((C . t)
;;                                   (dot . t)
;;                                   (emacs-lisp . t)
;;                                   (go . t)
;;                                   (ipython . t)
;;                                   (latex . t)
;;                                   (shell . t)
;;                                   ))

;;   (setq org-directory (expand-file-name "~/hobby/org-gtd/"))
;;   (setq org-default-notes-file (expand-file-name "notes.org" org-directory))
;;   (setq
;;    ec-capture-dir org-directory
;;    ec-inbox-org (expand-file-name "inbox.org" ec-capture-dir)
;;    ec-gtd-org (expand-file-name "gtd.org" ec-capture-dir)
;;    ec-tickler-org (expand-file-name "tickler.org" ec-capture-dir)
;;    ec-someday-org (expand-file-name "someday.org" ec-capture-dir)
;; ;;   org-refile-targets `((,ec-gtd-org :maxlevel . 9)
;; ;;                        (,ec-someday-org :maxlevel . 9)
;; ;;                        (,ec-tickler-org :maxlevel . 9))
;;  ;;  org-refile-use-outline-path 'file
;;  ;;  org-outline-path-complete-in-steps nil
;;  ;;  org-refile-allow-creating-parent-nodes 'confirm
;;  ;;  org-enforce-todo-dependencies t
;;  ;;  org-enforce-todo-checkbox-dependencies t
;;    )

;; ;;  (setq
;; ;;   org-use-property-inheritance t
;; ;;   org-cycle-separator-lines 0
;; ;;   org-latex-create-formula-image-program 'imagemagick
;; ;;   )

;;   (setq org-agenda-files (list ec-inbox-org ec-gtd-org ec-tickler-org))

;;   (setq org-capture-templates
;;         '(
;;           ("w" "Weekly Plan" entry (file+olp+datetree ec-gtd-org "Weekly plan")
;;            "* TODO %?\n%U\n" :clock-in t :clock-resume t)
;;           ("t" "Todo [inbox]" entry (file+headline ec-inbox-org "Tasks")
;;            "* TODO %?\n %U \n %a %i\n")
;;           ("T" "Tickler" entry (file+headline ec-tickler-org "Tickler")
;;            "* TODO %i%?\n %U")
;;           ("K" "Cliplink capture task" entry (file+headline ec-inbox-org "")
;;            "* TODO %(org-cliplink-capture) \n SCHEDULED: %t\n" :empty-lines 1)))

;;  ;; (setq org-export-backends '(ascii beamer latex confluence org))

;;   ;; ;; plantuml
;;   ;; (let ((plantuml-jar (car (file-expand-wildcards (ec-expand-env (expand-file-name "plantuml/libexec/plantuml*.jar" "${BREW_APP_HOME}"))))))
;;   ;;   (when (and (stringp plantuml-jar)
;;   ;;              (file-exists-p plantuml-jar))
;;   ;;     (setq -rg-plantuml-jar-path plantuml-jar)
;;   ;;     (add-to-list 'org-babel-load-languages '(plantuml . t))))

;;   ;; (add-hook 'org-clock-out-hook #'ec-remove-empty-drawer-on-clock-out 'append)

;;   ;; (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))


;;   ;; ;; ditaa
;;   ;; (let ((ditaa-jar (car (file-expand-wildcards (ec-expand-env (expand-file-name "ditaa/libexec/ditaa*.jar" "${BREW_APP_HOME}"))))))
;;   ;;   (when (and (stringp ditaa-jar)
;;   ;;              (file-exists-p ditaa-jar))
;;   ;;     (setq org-ditaa-jar-path ditaa-jar)
;;   ;;     (add-to-list 'org-babel-load-languages '(ditaa . t))))

;;   ;; (setq org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")

;;   ;; Add 'minted' to the default packages
;;   (add-to-list 'org-latex-packages-alist '("" "minted"))

;;   ;; Tell the latex export to use the minted package for source code coloration.
;;   (setq org-latex-listings 'minted)

;;   ;; Let the exporter use the -shell-escape option to let latex execute
;;   ;; external programs. Execute multiple times to make sure all the
;;   ;; indexes would be generated properly.
;;   (setq org-latex-pdf-process
;;         '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;           "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;           "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; ;;  (setq org-todo-keywords
;; ;;        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
;; ;;                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING"))))
;; ;;
;; ;;  (setq org-todo-keyword-faces
;; ;;        '(("TODO" :foreground "red" :weight bold)
;; ;;          ("NEXT" :foreground "cyan" :weight bold)
;; ;;          ("DONE" :foreground "green" :weight bold)
;; ;;          ("WAITING" :foreground "orange" :weight bold)
;; ;;          ("HOLD" :foreground "magenta" :weight bold)
;; ;;          ("CANCELLED" :foreground "forest green" :weight bold)
;; ;;          ("MEETING" :foreground "forest green" :weight bold)))

;;   ;; Disable change status with "Shift + left/right"
;;   ;; (setq-default org-treat-S-cursor-todo-selection-as-state-change nil)

;;   ;; Automatic insert tags
;;   ;; (setq org-todo-state-tags-triggers
;;   ;;       (quote (("CANCELLED" ("CANCELLED" . t))
;;   ;;               ("WAITING" ("WAITING" . t))
;;   ;;               ("HOLD" ("WAITING") ("HOLD" . t))
;;   ;;               (done ("WAITING") ("HOLD"))
;;   ;;               ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
;;   ;;               ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
;;   ;;               ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))


;;   ;; Task Priorities
;;   ;; (setq-default org-enable-priority-commands t)
;;   ;; (setq-default org-default-priority ?E)
;;   ;; (setq-default org-lowest-priority ?E)

;;   ;; ignore leading starts or tags on heading for 'org-beginning-of-line' and
;;   ;; 'org-end-of-line'
;;   (setq org-special-ctrl-a/e t)
  )


(after! org-roam
  (setq org-roam-ref-capture-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           "%?"
           :file-name "websites/${slug}"
           :head "#+TITLE: ${title}
    #+ROAM_KEY: ${ref}
    - source :: ${ref}"
           :unnarrowed t))))
