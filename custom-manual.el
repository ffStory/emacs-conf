;;; extra.el --- emacs_conf
;;; Commentary:
;; 补全括号
;;; Code:
(electric-pair-mode t)

(put 'upcase-region 'disabled nil)

;; 高亮当前行
(global-hl-line-mode 1)
(load-theme 'gruvbox t)
(setq-default default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; 满屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(fset 'yes-or-no-p 'y-or-n-p)

;;Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(provide 'custom-manual)

;;; extra.el ends here
