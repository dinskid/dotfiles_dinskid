;;; early-init.el -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum)
(setq native-comp-deferred-compilation nil)
(setq load-prefer-newer noninteractive)
(define-advice load-file (:override (file) silence)
  (load file nil 'nomessage))
(define-advice startup--load-user-init-file (:before (&rest _) init-doom)
  (advice-remove #'load-file #'load-file@silence))
(set-language-environment "UTF-8")
(setq default-input-method nil)
(setq user-emacs-directory (file-name-directory load-file-name))
(add-hook 'after-init-hook 'global-company-mode)

