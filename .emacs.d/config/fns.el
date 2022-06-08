(defun m/c ()
  "Clean emacs and reset it - kinda"
  (interactive)
  ;; delete all the buffers first
  (let ((name))
    (dolist (buf (buffer-list))
      (if (not (s-starts-with? " " (buffer-name buf)))
	(kill-buffer buf))))
  ;; reinit dashboard
  (dashboard-refresh-buffer))

