(defun send-to-vterm
    (cmd)
  (require 'vterm)
  (vterm)
  (vterm-send-string "clear")
  (vterm-send-return)
  (vterm-send-string cmd)
  (vterm-send-return))
