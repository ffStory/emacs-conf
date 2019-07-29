;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
; (package-refresh-contents)

;;------------- js2-mode begin -----------
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;;------------- js2-mode end -----------

;;------------- company-mode start -------------
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;------------- company-mode end -------------

;;------------- flycheck begin -------------
(require 'flycheck)
(global-flycheck-mode)
;;------------- flycheck end -------------

;;------------- find-file-in-project begin -------------
(require 'find-file-in-project)
(setq-default ffip-project-root "~/Desktop/work/hap/heroes_and_puzzles-client/hap/assets/Script")
(setq-default ffip-diff-backends
              '(ffip-diff-backend-git-show-commit
                "cd $(git rev-parse --show-toplevel) && git diff"
                "cd $(git rev-parse --show-toplevel) && git diff --cached"
                ffip-diff-backend-hg-show-commit
                ("Diff from `kill-ring'" . (car kill-ring))
                "cd $(hg root) && hg diff"
                "svn diff"))
(setq-default ffip-prune-patterns `("*.meta*", "*.json"))

(global-set-key (kbd "C-x f") 'find-file-in-project)
(global-set-key (kbd "C-x p") 'find-directory-in-project-by-selected)
;;------------- find-file-in-project end -------------

;;------------- hungry-delete begin -------------
(require 'hungry-delete)
(global-hungry-delete-mode)
;;------------- hungry-delete end -------------

;;------------- popwin hegin -------------
; (require 'popwin)
; (popwin-mode 1)
;;------------- popwin end -------------

;;------------- recentf begin -------------
; (require 'recentf)
; (recentf-mode 1)
;;------------- recentf end -------------

;;-------------  counsel begin -------------
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq search-default-mode #'char-fold-to-regexp)

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

;;-------------  yasnippet begin -------------
(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs
      '(
        "~/.emacs.d/snippets"                 ;; personal snippets
        ; "~/.emacs.d/elpa/yasnippet-snippets-20180616.1005/snippets" ;; the yasmate collection
        ))
;;-------------  yasnippet begin -------------

;;-------------  tide begin -------------
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;;-------------  tide end-------------

(require 'which-key)
(which-key-mode)

(provide 'packages)
;;; packages.el ends here
