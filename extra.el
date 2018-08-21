;;; extra.el --- emacs_conf
;;; Commentary:
;; 补全括号
;;; Code:
(electric-pair-mode t)

(put 'upcase-region 'disabled nil)

;; 高亮当前行
(global-hl-line-mode 1)

(setq-default default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; 满屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(fset 'yes-or-no-p 'y-or-n-p)


(provide 'extra)
             
;;; extra.el ends here
