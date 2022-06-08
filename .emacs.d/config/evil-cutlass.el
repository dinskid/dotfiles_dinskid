;;; Credits: https://github.com/ahmadseleem/ViMacs/blob/master/evil/vimacs.el
(defmacro without-evil-mode (&rest do-this)
  ;; Check if evil-mode is on, and disable it temporarily
  `(let ((evil-mode-is-on (evil-mode?)))
     (if evil-mode-is-on
         (disable-evil-mode))
     (ignore-errors
       ,@do-this)
       (if evil-mode-is-on
         (enable-evil-mode))))

(defmacro evil-mode? ()
  "Checks if evil-mode is active. Uses Evil's state to check."
  `evil-state)

(defmacro disable-evil-mode ()
  "Disable evil-mode with visual cues."
  `(progn
     (evil-mode 0)
     (message "Evil mode disabled")))

(defmacro enable-evil-mode ()
  "Enable evil-mode with visual cues."
  `(progn
     (evil-mode 1)
     (message "Evil mode enabled")))

;; delete: char
(evil-define-operator evil-destroy-char (beg end type register yank-handler)
  :motion evil-forward-char
  (evil-delete-char beg end type ?_))

;; delete: char (backwards)
(evil-define-operator evil-destroy-backward-char (beg end type register yank-handler)
  :motion evil-backward-char
  (evil-delete-backward-char beg end type ?_))

;; delete: text object
(evil-define-operator evil-destroy (beg end type register yank-handler)
  "Vim's 's' without clipboard."
  (evil-delete beg end type ?_ yank-handler))

;; delete: to end of line
(evil-define-operator evil-destroy-line (beg end type register yank-handler)
  :motion nil
  :keep-visual t
  (interactive "<R><x>")
  (evil-delete-line beg end type ?_ yank-handler))

;; paste: after
(defun evil-destroy-paste-after ()
  (interactive)
  (without-evil-mode
     (delete-region (point) (mark))
     (evil-paste-after 1)))

;; nc <=> no-copy
(evil-define-operator evil-nc-change (beg end type register yank-handler delete-func)
  (interactive "<R><x><y>")
  (evil-change beg end type ?_ yank-handler delete-func))

(evil-define-operator evil-nc-change-line (beg end type register yank-handler)
  :motion evil-end-of-line-or-visual-line
  (interactive "<R><x><y>")
  (evil-change-line beg end type ?_ yank-handler))

(evil-define-operator evil-nc-change-whole-line (beg end register yank-handler)
  :motion evil-line-or-visual-line
  :type line
  (interactive "<r><x>")
  (evil-change-whole-line beg end ?_ yank-handler))

;; Clipboard bypass key rebindings
(define-key evil-normal-state-map "d" #'evil-destroy)
(define-key evil-normal-state-map "D" #'evil-destroy-line)
(define-key evil-normal-state-map "x" #'evil-destroy-char)
(define-key evil-normal-state-map "c" #'evil-nc-change)
(define-key evil-normal-state-map "C" #'evil-nc-change-line)
(define-key evil-normal-state-map "S" #'evil-nc-change-whole-line)
(define-key evil-visual-state-map "p" #'evil-destroy-paste-after)
;; move: default behaviour of 'd'
(define-key evil-normal-state-map "m" #'evil-delete) ;; note: this delete mapping to 'evil-set-marker
(define-key evil-normal-state-map "M" #'evil-delete-line)
