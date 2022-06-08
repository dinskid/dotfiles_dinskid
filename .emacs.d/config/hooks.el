(add-hook 'prog-mode-hook (lambda ()
			    (setq display-line-numbers 'relative)
			    (modify-syntax-entry ?_ "w")))
(add-hook 'org-mode-hook (lambda ()
			    (setq display-line-numbers 'relative)
			    (modify-syntax-entry ?_ "w")))
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'before-save-hook 'lsp-format-buffer)

