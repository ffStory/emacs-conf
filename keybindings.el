;;; keybindings.el --- etc
;;; Commentary:
;;; Code:
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "<f2>") 'open-init-file)
(provide 'keybindings)
;;; keybindings.el ends here
