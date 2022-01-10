(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)            ; Disable the menu bar
(setq user-emacs-directory (expand-file-name "~/.emacsdir/")
      url-history-file (expand-file-name "url/history" user-emacs-directory))
(setq backup-directory-alist `(("~/.emacsdir/saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(load "~/.emacs.d/config/defaults.el")
