;; #####################
;; initial setup
;; #####################
;; install packages
(require 'cl)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)
(setq dotfiles-packages-list
      '(
        helm
        helm-smex
        helm-gtags
        color-theme
        twilight-theme
        mozc
        company-go
        flycheck
        ))
(defun dotfiles-auto-install-packages ()
  (package-refresh-contents)
  (mapc #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
        dotfiles-packages-list)
  )
(dotfiles-auto-install-packages)

;; #####################
; system configurations
;; #####################
(defun add-to-load-path (&rest paths)
  (let (path)
	(dolist (path paths paths)
	  (let ((default-directory
			  (expand-file-name (concat user-emacs-directory path))))
		(add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
		 	(normal-top-level-add-subdirs-to-load-path))))))

;add dir and subdir to load-path
;(add-to-load-path "elpa" "elisp")
(add-to-load-path "elpa")

;;common clipboard
(setq x-select-enable-clipboard t)

;; let stop to make a backup file
(setq make-backup-files nil)

;; tab width
(custom-set-variables '(tab-width 4))

;; delete initial scratch messages
(setq initial-scratch-message "")
(setq inhibit-startup-screen t)

;; enable MELPA
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; configure golang environment
;; path to Go and Go packages
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin/"))
(add-to-list 'exec-path (expand-file-name "/home/aci0as4n/.local/go/bin"))

;; #####################
;; enable packages
;; #####################

;; mozc
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(global-set-key (kbd "C-c C-o") 'toggle-input-method)
(setq mozc-candidate-style 'overlay)

;; helm
(require 'helm-config)
(helm-mode t)

;; helm-smex
;(require 'smex)
;(smex-initialize)

;;colortheme
(require 'color-theme)
(color-theme-initialize)
(color-theme-billw)

;; column-marker
(require 'column-marker)
(global-set-key [?\C-c ?m] 'column-marker-1)

;; load twilight-theme
;(load-theme 'twilight t)
;; load and configure
(require 'go-mode)
(require 'company-go)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook
          (lambda()
           (add-hook 'before-save-hook' 'gofmt-before-save)
           (local-set-key (kbd "\M-.") 'godef-jump)
           (set (make-local-variable 'company-backends) '(company-go))
           (company-mode)
           (setq indent-tabs-mode nil)  ; use tab
           (setq c-basic-offset 4)      ; set tab-width to 4
           (setq tab-width 4)
           ))

;; configure gtags-mode
(add-to-list 'load-path "/usr/local/share/gtags")
(autoload 'gtags-mode "gtags" "" t)
;; (setq gtags-mode-hook
;;       '(lambda ()
;;          (local-set-key "\M-t" 'gtags-find-tag) ;jump to the function decl.
;;          (local-set-key "\M-r" 'gtags-find-rtag) ;jump to the function ref.
;;          (local-set-key "\M-s" 'gtags-find-symbol) ;jump to the variable decl.
;;          (local-set-key "\C-t" 'gtags-pop-stack) ;go back to the previous buf.
;;          ))
;; (add-hook 'c-mode-hook 'gtags-mode)
;; (add-hook 'c++-mode-hook 'gtags-mode)
;; (add-hook 'go-mode-hook 'gtags-mode)

(require 'helm-gtags)
(add-hook 'go-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'python-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))
(setq helm-gtags-path-style 'root)
(setq helm-gtags-auto-update t)
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-g") 'helm-gtags-dwim)
             (local-set-key (kbd "M-s") 'helm-gtags-show-stack)
             (local-set-key (kbd "M-p") 'helm-gtags-previous-history)
             (local-set-key (kbd "M-n") 'helm-gtags-next-history)
             ))

;; #####################
;; key-bind configurations
;; #####################

;; replace original cmds by helm
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; #####################
;; user interface configurations
;; #####################

;; display full path in title
(setq frame-title-format
      (format "%s@%s:%%f" (user-login-name) (system-name)))

;;hide menu/tool bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; display line number
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#800"
                    :height 0.9)

;; line number format
(setq linum-format "%4d")

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; row number in mode line
(line-number-mode t)

;; column number in mode line
(column-number-mode t)

;; show current time
(setq display-time-day-and-date t
   display-time-24hr-format t)
(display-time)

;; transparent buffer area
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; frame size
(add-to-list 'default-frame-alist '(height . 72))
(add-to-list 'default-frame-alist '(width . 120))

;; #####################
;; editing configurations
;; #####################

;;charsize
(set-face-attribute 'default nil :height 80)

;; emphasize inside of the parenthesis
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; region color of parenthesis
(set-face-background 'show-paren-match-face "#500")

;; color of the selected region
(set-face-background 'region "#555")

;; emphasize white space in the end of lines
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; deal with a tab as a space
(setq-default indent-tabs-mode nil)

;; line spacing
(setq-default line-spacing 0)

;; scroll with step one line
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode
(set-scroll-bar-mode 'right)

;; rectangle selection by C-Ret
;; key-binds in detail: http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; cua-mode : rectangle select
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; #####################
;; those require overriden configurations
;; #####################

;; charcode
(set-default-coding-systems 'utf-8)

;; delete trailing space
(add-hook 'before-save-hook 'delete-trailing-whitespace)
