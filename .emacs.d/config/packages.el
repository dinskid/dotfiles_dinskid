(require 'use-package)

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-Y-yank-to-eol t)
  (defalias #'forward-evil-word #'forward-evil-symbol)
  :config
  (evil-set-undo-system 'undo-redo)
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
(use-package evil-surround
  :ensure t
  :defer 1
  :after evil-collection
  :config
  (load-file (concat user-emacs-directory "./config/evil-cutlass.el"))
  (setq evil-surround-operator-alist
	'((evil-nc-change . change)
	  (evil-destroy . delete)))
  (global-evil-surround-mode 1))
(use-package evil-leader
  :after evil
  :ensure t
  :after evil)
(use-package evil-commentary
  :defer 5
  :ensure t
  :config
  (evil-commentary-mode))

(use-package lsp-mode
  :ensure t
  :defer 5
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (c++-mode . lsp-deferred)
  (js-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-rust-server 'rust-analyzer
	lsp-rust-analyzer-server-display-inlay-hints t))

(use-package orderless
  :after selectrum
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
(use-package prescient
  :after selectrum
  :ensure t)
(use-package selectrum-prescient
  :after (selectrum prescient)
  :ensure t)
(use-package selectrum
  :ensure t
  :config
  (setq selectrum-prescient-enable-filtering nil)
  (selectrum-prescient-mode +1)
  (prescient-persist-mode +1)
  (selectrum-mode))

(use-package company
  :ensure t
  :defer 1
  :config
  (company-tng-mode))

(use-package zoxide
  :defer 4
  :ensure t)

(use-package general
  :after evil
  :ensure t
  :config
  (general-evil-setup t)
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(use-package vterm
  :defer 5
  :ensure t
  :config
  (setq-default vterm-clear-scrollback-when-clearing t)
  (evil-collection-define-key 'insert 'vterm-mode-map
    (kbd "C-S-v") 'vterm-yank))
(use-package vterm-toggle
  :ensure t
  :after vterm
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
	       '((lambda(bufname _) (with-current-buffer bufname
				      (or (equal major-mode 'vterm-mode)
					  (string-prefix-p vterm-buffer-name bufname))))
		 (display-buffer-reuse-window display-buffer-at-bottom)
		 (reusable-frames . visible)
		 (window-height . 0.3))))

(use-package projectile
  :ensure t
  :defer 3
  :config
  (projectile-mode 1))

(use-package yasnippet
  :ensure t
  :defer 5
  :config
  (require 'yasnippet)
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"))
  (yas-global-mode 1))

(use-package esup
  :defer t
  :ensure t
  ;; To use MELPA Stable use ":pin melpa-stable",
  :pin melpa)

(use-package magit
  :defer t
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package leetcode
  :defer t
  :ensure t
  :config
  (setq leetcode-path "~/cp/rand/lc/"
	leetcode-language "c++"))

;; language support
;; lua mode

(use-package lua-mode
  :defer t
  :ensure t)
(use-package rustic
  :defer t
  :ensure t)

;; org mode
(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode))
(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; ui
(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))
(use-package mood-line
  :ensure t
  :config
  (mood-line-mode))
(use-package hl-todo
  :ensure t
  :defer 10
  :config
 (setq hl-todo-keyword-faces
	'(("TODO"   . "#FF0000")
	  ("WARN"   . "#FFA033")
	  ("FIXME"  . "#FF0000")
	  ("DEBUG"  . "#A020F0")))
  (global-hl-todo-mode))
