;; company
(setq company-minimum-prefix-length 1)
(add-hook 'after-init-hook 'company-tng-mode) ;; YCM style completion

;; set the leader for evil
(evil-set-leader 'normal (kbd "SPC"))

;; for the posframe
(setq vertico-posframe-height 37)

;; yasnippets
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(require 'yasnippet)
(yas-global-mode 1)
