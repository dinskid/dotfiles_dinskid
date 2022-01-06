(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)
(straight-use-package 'use-package)

;; system
(use-package exec-path-from-shell
  :straight t
  :config
  (exec-path-from-shell-initialize))

(use-package posframe
  :straight t)

(use-package evil
  :straight t
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package undo-tree
  :straight t
  :config
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree))
(use-package evil-collection
  :straight t
  :after evil
  :ensure t
  :config
  (evil-collection-init))
(use-package evil-surround
  :straight t
  :ensure t
  :config
  (global-evil-surround-mode 1))
(use-package evil-commentary
  :straight t
  :after evil
  :ensure t
  :config
  (evil-commentary-mode))

(use-package vertico
  :straight t
  :init
  (setq vertico-count most-positive-fixnum)
  (vertico-mode)
  (setq read-file-name-completion-ignore-case t
	read-buffer-completion-ignore-case t
	completion-ignore-case t))

(use-package vertico-posframe
  :straight t
  :config
  (vertico-posframe-mode 1))

(use-package orderless
  :straight t
  :init
  (setq completion-styles '(basic substring partial-completion flex)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package lsp-mode
  :straight t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;;(rust-mode . lsp-deferred)
	 ;; :commands (lsp lsp-deferred)
         (js-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (c++-mode . lsp-deferred))
  :commands (lsp lsp-deferred))
(use-package lsp-ui
  :straight t)

(use-package company
  :straight t)

(use-package vterm
  :straight t
  :config
  (setq vterm-kill-buffer-on-exit 1))

(use-package yasnippet
  :straight t)

(use-package format-all
  :straight t)

(use-package general
  :straight t
  :config
  (general-evil-setup t)
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(use-package projectile
  :straight t)

(use-package fzf
  :straight t)

;; visual elements
(use-package vscode-dark-plus-theme
  :straight t
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

(use-package doom-modeline
  :straight t
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons
  :straight t
  :if (display-graphic-p))

;; lang
(use-package rust-mode
  :straight t)
