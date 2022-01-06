					; ;; make leader work on dired
					; ;; https://github.com/cofi/evil-leader/issues/13
;; (global-set-key (kbd "SPC") nil)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
;; ;; Enable line numbers for some modes
;; (dolist (mode '(text-mode-hook
;;                 prog-mode-hook
;;                 conf-mode-hook))
;;   (add-hook mode (lambda () (display-line-numbers-mode 1))))

(setq large-file-warning-threshold nil)
(setq vc-follow-symlinks t)
(setq ad-redefinition-action 'accept)
(setq help-window-select t)
(set-default 'truncate-lines t)
(set-face-attribute 'default nil :font "Fira Code" :height 102)
(setq enable-recursive-minibuffers  t)
(minibuffer-depth-indicate-mode 1)



(add-hook 'emacs-startup-hook 'my-startup-fcn)
(defun my-startup-fcn ()
  "do fancy things"
  (let ((my-buffer (get-buffer-create "my-buffer")))
    (with-current-buffer my-buffer
      (insert "some stuff\nmore stuff"))
    (switch-to-buffer my-buffer)))


(load "~/.emacs.d/config/packages.el")
(load "~/.emacs.d/config/utils.el")
(load "~/.emacs.d/config/config/oneliners.el")
(load "~/.emacs.d/config/config/formatters.el")

;; always load keymaps finally
(load "~/.emacs.d/config/config/general.el")
