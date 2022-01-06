(defun open-config ()
  (interactive)
  (cd "~/.emacs.d"))

(defun toggle-term--kil-window (a b)
  "Kill the window on vterm exit"
  (interactive)
  (kill-buffer-and-window))

(defun toggle-term (name)
  "Creates a togglable term"
  (interactive)
  (split-window-below -17)
  (other-window 1)
  (cond ((get-buffer name) (switch-to-buffer name))
	(t
	 (setq vterm-exit-functions 'toggle-term--kill-window)
	 (setq vterm-buffer-name-string name)
	 (vterm default-directory))))