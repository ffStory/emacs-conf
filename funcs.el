;;; funcs.el --- emacs_conf
;;; Commentary:
;; 快速打开配置文件
;;; Code:
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/emacs-conf/packages.el"))

;; 缩进对齐
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

;; 缩进对齐
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;; 选中当前光标所在单词
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
(provide 'funcs)
;;; funcs.el ends here
