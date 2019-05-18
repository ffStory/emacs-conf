;;; custom.el --- emacs_conf
;;; Commentary:
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3c3836" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(c-basic-offset 4)
 '(company-idle-delay 0)
 '(company-tooltip-idle-delay 0)
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (gruvbox)))
 '(custom-safe-themes (quote (default)))
 '(delete-selection-mode t)
 '(global-auto-revert-mode t)
 '(global-linum-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (## tide electric-operator selectric-mode hippie-expand-slime recently lua-mode yasnippet-snippets yasnippet youdao-dictionary counsel-gtags ggtags counsel-etags iedit expand-region reveal-in-osx-finder popwin ivy hungry-delete company flycheck company-ycmd counsel swiper company-tern js-doc magit find-file-in-project ycmd powerline js2-mode gruvbox-theme)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 90)
 '(recentf-max-saved-items 10)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 170 :width normal :foundry "nil" :family "Source Code Pro")))))

;;; custom.el ends here
