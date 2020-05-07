;;; vhdlplus/config.el -*- lexical-binding: t; -*-
(defvar ec-vhdl-tool-config "vhdltool-config.yaml"
  "vhdl-tool config file")

(after! vhdl-mode
  (defun ec-vhdl--init ()
    "Initial function which should be added to VHDL mode hook."
    (setq-default
     vhdl-basic-offset 4
     vhdl-clock-edge-condition 'function
     vhdl-conditions-in-parenthesis t
     vhdl-end-comment-column 100
     vhdl-highlight-special-words t
     vhdl-highlight-translate-off t
     vhdl-highlight-verilog-keywords t
     vhdl-include-port-comments t
     vhdl-include-type-comments t
     vhdl-inline-comment-column 70
     vhdl-instance-name '(".*" . "i_\\&")
     vhdl-reset-active-high t
     vhdl-reset-kind 'sync
     vhdl-standard '(8 (math))
     vhdl-underscore-is-part-of-word t
     vhdl-upper-case-constants t
     vhdl-upper-case-enum-values t)
    (add-to-list 'vhdl-offsets-alist '(arglist-close . 0)))


  (defun ec-vhdl-tool--server-process-buffer-name ()
    "Get vhdl-tool server name for current project"
    (format "vhdl-tool server@%s" (projectile-project-root)))

  (defun ec-vhdl-tool--server-start-p (buffer)
    "Return non-nil if the BUFFER associated process is started."
    (let ((process (get-buffer-process buffer)))
      (if process(eq (process-status (get-buffer-process buffer)) 'run)
        nil)))

  (defun ec-vhdl-tool-stop-server ()
    (interactive)
    (let ((buffer (ec-vhdl-tool--server-process-buffer-name)))
      (when (ec-vhdl-tool--server-start-p buffer)
        (kill-process (get-buffer-process buffer)))))

  (defun ec-vhdl-tool-start-server ()
    "Start vhdl-tool server for linting."
    (interactive)
    (let* ((default-directory (projectile-project-root))
           (buffer (ec-vhdl-tool--server-process-buffer-name)))
      (unless (executable-find "vhdl-tool")
        (error "Can not find vhdl-tool"))
      (unless (file-exists-p ec-vhdl-tool-config)
        (error "Can not find %s @ %s" ec-vhdl-tool-config default-directory))
      (unless (ec-vhdl-tool--server-start-p buffer)
        (message "Starting vhdl-tool server")
        (start-process buffer nil "vhdl-tool" "server"))))

  (after! flycheck
    (flycheck-define-checker vhdl-tool
      "A VHDL syntax checker, type checker and linter using VHDL-Tool.
See `http://vhdltool.com'."
      :command ("vhdl-tool" "client" "lint" "--compact" source-inplace)
      :error-patterns
      ((warning line-start (file-name) ":" line ":" column ":w:" (message) line-end)
       (error line-start (file-name) ":" line ":" column ":e:" (message) line-end))
      :modes vhdl-mode)
    (add-to-list 'flycheck-checkers 'vhdl-tool)
    (defun ec-vhdl-setup-flycheck-after-lsp ()
      "Setup vhdl-tool as flycheck checker for VHDL mode"
      (when (eq major-mode 'vhdl-mode)
        (flycheck-select-checker 'vhdl-tool)
        (setq flycheck-checker 'vhdl-tool))))

  (after! lsp
    (add-hook! lsp-mode #'ec-vhdl-setup-flycheck-after-lsp))

  (add-hook! vhdl-mode #'ec-vhdl--init #'lsp #'ec-vhdl-tool-start-server #'ec-vhdl-setup-flycheck-after-lsp))
