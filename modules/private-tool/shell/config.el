;;; private-tool/shell/config.el -*- lexical-binding: t; -*-

(use-package! exec-path-from-shell
  :custom
  (exec-path-from-shell-variables '("PATH" "MANPATH" "PKG_CONFIG_PATH" "BREW_HOME" "BREW_APP_HOME") "This adds PKG_CONFIG_PATH to the list of variables to grab. I prefer to set the list explicitly so I know exactly what is getting pulled in.")
  :init
  (when (memq window-system '(mac ns x))
    (let* ((bash-home (substring (shell-command-to-string "brew --prefix bash") 0 -1))
           (bash-path (expand-file-name "bin/bash" bash-home)))
      (if (file-directory-p bash-home)
          (setq shell-file-name bash-path)))
    (exec-path-from-shell-initialize)))
