(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa"."https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

  (require 'evil)
  (evil-mode 1)

(setq TeX-PDF-mode t)

(setq TeX-view-program-selection
      '((output-dvi "DVI Viewer")
        (output-pdf "Evince")
        (output-html "HTML Viewer")))



(add-to-list 'load-path "/usr/bin/mu")
(require 'smtpmail)

; smtp
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials
      '(("smtp.1and1.com" 587 nil nil))
      smtpmail-default-smtp-server "smtp.1and1.com"
      smtpmail-smtp-server "smtp.1and1.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

(require 'mu4e)

(setq mu4e-maildir (expand-file-name "~/.mail/betlach"))

(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder   "/Sent")
(setq mu4e-trash-folder  "/Trash")
(setq message-signature-file "~/.signature") ; put your signature in this file

; get mail
(setq mu4e-get-mail-command "mbsync -a ~/.mbsyncrc"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 120
      mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include nil)

(setq mu4e-maildir-shortcuts
      '( ("/INBOX"               . ?i)
         ("/Sent"   . ?s)
         ("/Trash"       . ?t)
         ("/Drafts"    . ?d)))

;; show images
(setq mu4e-show-images t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
(setq mu4e-reply-to-address "honza@betlach.name"
    user-mail-address "honza@betlach.name"
    user-full-name  "Jan Betlach")

;; don't save message to Sent Messages, IMAP takes care of this
; (setq mu4e-sent-messages-behavior 'delete)

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flyspell-mode)))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
