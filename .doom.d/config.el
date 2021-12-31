;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dinesh Vikram V"
      user-handle "dinskid"
      user-mail-address "astrodini@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Fira Code" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-oceanic-next)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(defun runinterm
    (cmd evnvar)
  (vterm)
  (vterm-send-string envvar)
  (vterm-send-return)
  (vterm-send-string (concat "clear && " cmd))
  (vterm-send-return)
  (evil-normal-state)
  )

(defun make-folder ()
  (interactive)
  (eshell-command "mkdir .outputs")
  )

(defun compile-and-run ()
  "compile the code with debug flags and run the executable"
  (interactive)
  (setq fname (file-name-base buffer-file-name))
  (setq envvar "export CXXFLAGS='-std=c++17 -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -DLOCAL'")
  (setq cmd (concat "make " fname " && mv " fname " .outputs/ && .outputs/" fname ))
  (runinterm cmd envvar)
  )

(defun yankall ()
  "copy everything"
  (interactive)
  (evil-ex "%y+")
  (kbd "<CR>")
  )
(map! :leader
      (:prefix ("d" . "make")
       :desc "foo()"
       "m" #'compile-and-run
       "r" #'run
       "s" #'compile-submit-and-run
       ))

(map! :leader
      "hh" #'windmove-left)
(map! :leader
      "jj" #'windmove-down)
(map! :leader
      "kk" #'windmove-up)
(map! :leader
      "ll" #'windmove-right)
(map! :leader
      "qw" #'delete-window)
(map! :leader
      "y" #'yankall)

(set-file-template! "\\.c\\(?:c\\|pp\\)$" :ignore t)

(setq confirm-kill-emacs nil)

(map! :leader
      :desc "Open like spacemacs" "SPC" #'counsel-M-x)

(setq-hook! 'cpp-mode-hook
  c-basic-offset 2
  tab-width 2)

(setq-hook! 'python-mode-hook
  python-basic-offset 2
  tab-width 2)
