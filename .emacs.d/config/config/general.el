(require 'general)

(general-define-key 
  :keymaps 'ivy-mode-map 
  "C-j" 'ivy-next-line 
  "C-k" 'ivy-previous-line)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(general-define-key
 :states 'normal
 :keymaps 'override
 :prefix "SPC"
 "." 'find-file
 "f" 'fzf
 "q" 'delete-window
 "," 'switch-to-buffer
 ";" 'execute-extended-command
 "y" (lambda () (interactive) (gui-set-selection 'CLIPBOARD (buffer-string))))
 

