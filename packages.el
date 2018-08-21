;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Code:
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (add-to-list
;;    'package-archives
;;    ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
;;    '("melpa" . "http://melpa.milkbox.net/packages/")
;;    t))
 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
(package-initialize)

;;------------- js2-mode begin -----------
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-hook 'js2-mode-hook
          (lambda ()
            (setq imenu-create-index-function 'js2-imenu-make-index))) ;; js2-imenu-make-index 在funcs.el 中定义


;;------------- js2-mode end -----------


;;------------- company-mode start -------------

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; (require 'ycmd) ;; 现在用tags
;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; (set-variable 'ycmd-server-command '("python" "/Users/fingerdance/ycmd/ycmd/"))
;; (set-variable 'ycmd-global-config "/Users/fingerdance/ycmd/examples/.ycm_extra_conf.py")
;; (require 'company-ycmd)
;; (company-ycmd-setup)

;; tern 补全 小项目适用
;; (add-to-list 'load-path "~/.emacs.d/lisp/tern/emacs/")
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (require 'company-tern)
;; (add-to-list 'company-backends 'company-tern)

;;------------- company-mode end -------------

;;------------- flycheck begin -------------
(require 'flycheck)
(global-flycheck-mode)
;;------------- flycheck end -------------

;;------------- find-file-in-project begin -------------
(require 'find-file-in-project)
(setq-default ffip-project-root "~/Desktop/work/kingdom/client/kingdom/assets/script/")
(setq-default ffip-diff-backends
              '(ffip-diff-backend-git-show-commit
                "cd $(git rev-parse --show-toplevel) && git diff"
                "cd $(git rev-parse --show-toplevel) && git diff --cached"
                ffip-diff-backend-hg-show-commit
                ("Diff from `kill-ring'" . (car kill-ring))
                "cd $(hg root) && hg diff"
                "svn diff"))
(setq-default ffip-prune-patterns `("*.js.meta*" "*.meta"))

(global-set-key (kbd "C-x f") 'find-file-in-project)
;;------------- find-file-in-project end -------------


;;------------- jsdoc begin -------------
(setq-default js-doc-mail-address "2422312148@qq.com"
	      js-doc-author (format "Fan Wang ")
	      js-doc-url "url of your website"
	      js-doc-license "")

 ;; (add-hook 'js2-mode-hook
 ;;           #'(lambda ()
 ;;               (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
	       ;; (define-key js2-mode-map "@" 'js-doc-insert-tag)
 ;;			   ))
;;------------- jsdoc end -------------

;;------------- hungry-delete begin -------------
(require 'hungry-delete)
(global-hungry-delete-mode)
;;------------- hungry-delete end -------------

;;------------- popwin hegin -------------
(require 'popwin)
(popwin-mode 1)
;;------------- popwin end -------------

;;------------- recentf begin -------------
(require 'recentf)
(recentf-mode 1)
;;------------- recentf end -------------

;;-------------  hippie-expand begin -------------
(setq-default hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

(global-set-key (kbd "s-/") 'hippie-expand)
;;-------------  hippie-expand end -------------

;;-------------  dired begin -------------
(setq-default dired-recursive-deletes 'always)
(setq-default dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq-default dired-dwin-target 1)
;;-------------  dired end -------------

;;-------------  show-paren begin -------------
(require 'paren)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-background 'show-paren-match "#6A7270")
(set-face-foreground 'show-paren-match "#FFEF28")
;; (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
;;-------------  show-paren end -------------

;;-------------  counsel begin -------------
(require 'ivy)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(ivy-mode 1)

(require 'counsel-etags)
;; Don't ask before re-reading changed TAGS files
(setq tags-revert-without-query t)
;; NO warning when loading large TAGS files
(setq large-file-warning-threshold nil)
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'after-save-hook
                      'counsel-etags-virtual-update-tags 'append 'local)))
;; You can setup `counsel-etags-ignore-directories' and `counsel-etags-ignore-filenames'
(eval-after-load 'counsel-etags
  '(progn
     ;; counsel-etags-ignore-directories does NOT support wildcast
     (add-to-list 'counsel-etags-ignore-directories "build_clang")
     ;; (add-to-list 'counsel-etags-ignore-directories "build_clang")
     ;; counsel-etags-ignore-filenames supports wildcast
     (add-to-list 'counsel-etags-ignore-filenames "TAGS")
     (add-to-list 'counsel-etags-ignore-filenames "*.json.meta")))

(setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~meta]\\'\\)"))

(global-set-key (kbd "C-s") 'counsel-grep-or-swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-c p f") 'counsel-git)
(global-set-key (kbd "C-c p s") 'counsel-ag)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)
(global-set-key (kbd "C-c i") 'counsel-imenu)
(global-set-key (kbd "C-c g" ) 'counsel-etags-grep-symbol-at-point)
(global-set-key (kbd "C-.") 'counsel-etags-find-tag-at-point)
(global-set-key (kbd "C-,") 'xref-pop-marker-stack)
;;-------------  counsel end -------------

;;-------------  ggtags begin -------------
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
(add-hook 'ggtags-mode 'js2-mode)
;;-------------  ggtags end -------------

;;-------------  translate begin -------------
(setq url-automatic-caching t)
(global-set-key (kbd "C-c t") 'youdao-dictionary-search-from-input)
;;-------------  tanslate end -------------

;;-------------  yasnippet begin -------------
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        "~/.emacs.d/elpa/yasnippet-snippets-20180616.1005/snippets" ;; the yasmate collection
        ))
;;-------------  yasnippet begin -------------

(provide 'packages)
;;; packages.el ends here
