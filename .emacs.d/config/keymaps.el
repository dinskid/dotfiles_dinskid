(require 'general)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(general-define-key
 :states 'normal
 :keymaps 'override
 :prefix "SPC"
 "." 'find-file
 "p" 'projectile-switch-project
 "f" 'projectile-find-file
 "q" 'delete-window
 "," 'ido-switch-buffer
 ";" 'execute-extended-command
 "SPC" 'execute-extended-command
 "t" (lambda () (interactive)
       (vterm)
       (evil-collection-vterm-insert))
 "y" (lambda () (interactive)
       (pulse-momentary-highlight-region 0 (buffer-size)) ;; gives visual feedback
       (gui-set-selection 'CLIPBOARD (buffer-string))) 
 "hh" 'windmove-left
 "jj" 'windmove-down
 "kk" 'windmove-up
 "ll" 'windmove-right)
