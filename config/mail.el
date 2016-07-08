(require 'mu4e)

(evil-leader/set-key
  "m" 'mu4e)

;; default
;; (setq mu4e-maildir "~/Maildir")

(setq mu4e-drafts-folder "/[Icloud].Drafts")
(setq mu4e-sent-folder   "/[Icloud].Sent Mail")
(setq mu4e-trash-folder  "/[Icloud].Trash")

;; don't save message to Sent Messages, Icloud/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; (See the documentation for `mu4e-sent-messages-behavior' if you have
;; additional non-Icloud addresses and want assign them different
;; behavior.)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
    '( ("/INBOX"               . ?i)
       ("/[Icloud].Sent Mail"   . ?s)
       ("/[Icloud].Trash"       . ?t)
       ("/[Icloud].All Mail"    . ?a)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
(setq
   user-mail-address "peter.zky@icloud.com"
   user-full-name  "Peter Zheng"
   mu4e-compose-signature
    (concat
      "Peter Zheng "
      "peter.zky@icloud.com"))

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
   starttls-use-gnutls t
   smtpmail-starttls-credentials '(("smtp.mail.me.com" 587 nil nil))
   smtpmail-auth-credentials
     '(("smtp.mail.me.com" 587 "peter.zky" nil))
   smtpmail-default-smtp-server "smtp.mail.me.com"
   smtpmail-smtp-server "smtp.mail.me.com"
   smtpmail-smtp-service 587)

;; alternatively, for emacs-24 you can use:
;;(setq message-send-mail-function 'smtpmail-send-it
;;     smtpmail-stream-type 'starttls
;;     smtpmail-default-smtp-server "smtp.gmail.com"
;;     smtpmail-smtp-server "smtp.gmail.com"
;;     smtpmail-smtp-service 587)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
