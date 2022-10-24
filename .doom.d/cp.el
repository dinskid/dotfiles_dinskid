;;; cp.el -*- lexical-binding: t; -*-

(defun send-to-vterm
    (cmd)
  (require 'vterm)
  (vterm)
  (vterm-send-string "clear")
  (vterm-send-return)
  (vterm-send-string cmd)
  (vterm-send-return))

(defun wrapper (cpcmd &optional close normal)
  (save-buffer)
  (setq-local file (file-name-nondirectory (buffer-file-name)))
  (setq-local runs (concat cpcmd " " file))
  (setq-local tosend (list "source ~/cp/compile.sh" runs))

  (dolist (cmd tosend)
    (send-to-vterm cmd))
  (if normal
      (evil-normal-state)
    (evil-insert-state)))

(defun prepare ()
  (interactive)
  (wrapper "prep" 't))

(defun compile ()
  (interactive)
  (wrapper "compr"))

(defun compileRun ()
  (interactive)
  (wrapper "compr"))

(defun compileSubmit ()
  (interactive)
  (wrapper "comps"))

(defun compileSubmitRun ()
  (interactive)
  (wrapper "compsr"))

(defun onlyRun ()
  (interactive)
  (wrapper "runc"))

(global-set-key (kbd "<f2>") 'prepare)
(global-set-key (kbd "<f5>") 'compileRun)
(global-set-key (kbd "<f6>") 'compileSubmitRun)
