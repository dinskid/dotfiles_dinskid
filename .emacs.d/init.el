(setq gc-cons-threshold (* 128 1024 1024)) ; setting gc threshold to high value

(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
      '(("org" . "https://orgmode.org/elpa/")
	("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))
;; initialize built-in package management
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(load-file (concat user-emacs-directory "./config/packages.el"))
(load-file (concat user-emacs-directory "./config/conf.el"))
(load-file (concat user-emacs-directory "./config/hooks.el"))
(load-file (concat user-emacs-directory "./config/keymaps.el"))
(load-file (concat user-emacs-directory "./config/cp.el"))
(load-file (concat user-emacs-directory "./config/fns.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(hl-todo rustic vscode-dark-plus-theme evil-org org-bullets lua-mode selectrum-prescient leetcode affe prescient ivy-posframe ivy-prescient counsel ivy evil-leader evil-nerd-commenter evil-commentary dashboard magit dracula-theme esup company yasnippet projectile vterm-toggle vterm zoxide use-package sublimity selectrum orderless oceanic-theme lsp-mode general evil-goggles evil-collection)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq gc-cons-threshold (* 2 1024 1024)) ;; resetting gc threshold
