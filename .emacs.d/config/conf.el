;; LSP related performance hacks
(setq read-process-output-max ;; 1mb
      (* 1024 1024))
(setq lsp-idle-delay 0.500)
(setq lsp-log-io nil) ; if set to true can cause a performance hit

(setq backup-directory-alist '(("." . "~/.emacs-crap"))
      auto-save-file-name-transforms '((".*" "~/.emacs-crap")))

(setq inhibit-startup-screen t)
(scroll-bar-mode -1)                ; Disable visible scrollbar
(tool-bar-mode -1)                  ; Disable the toolbar
(tooltip-mode -1)                   ; Disable tooltips
(menu-bar-mode -1)                  ; Disable tooltips
(electric-pair-mode) 	            ; auto-brakets
(setq-default truncate-lines t)     ; wrap lines
(setq help-window-select t)         ; auto focus help windows

;; completion
(setq completion-styles '(orderless))

;; Persist history over Emacs restarts
(savehist-mode)

;; Optional performance optimization
;; by highlighting only the visible candidates.
(setq orderless-skip-highlighting (lambda () selectrum-is-active))
(setq selectrum-highlight-candidates-function #'orderless-highlight-matches)

;; font face
(set-frame-font "Fira Code-11" nil t)

;; yank hightlight
(advice-add 'evil-yank :around
	    (lambda (orig-fn beg end &rest args)
	      (pulse-momentary-highlight-region beg end)
	      (apply orig-fn beg end args)))
