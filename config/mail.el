(use-package evil-mu4e
  :ensure t
  :config
  )

(require 'mu4e)

(evil-leader/set-key
  "0" 'mu4e)

(add-to-list 'mu4e-view-actions
	     '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; default
(setq mu4e-maildir "~/Mail")

;; (setq mu4e-drafts-folder "/[QQ].Drafts")
;; (setq mu4e-sent-folder   "/[QQ].Sent Mail")
;; (setq mu4e-trash-folder  "/[QQ].Trash")

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
	 ("/[QQ].Sent Mail"   . ?s)
	 ("/[QQ].Trash"       . ?t)
	 ("/[QQ].All Mail"    . ?a)
	 ))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
(setq
 user-mail-address "peterzky@qq.com"
 user-full-name  "Peter Zheng"
 mu4e-compose-signature
 (concat
  "Peter Zheng "
  "peterzky@qq.com"))

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

(require 'smtpmail)
;; (setq message-send-mail-function 'smtpmail-send-it
;;       starttls-use-gnutls t
;;       smtpmail-starttls-credentials '(("smtp.qq.com" 587 "378096232" nil))
;;       smtpmail-auth-credentials
;;       '(("smtp.qq.com" 587 "378096232" nil))
;;       smtpmail-default-smtp-server "smtp.qq.com"
;;       smtpmail-smtp-server "smtp.qq.com"
;;       smtpmail-smtp-service 587)

;; alternatively, for emacs-24 you can use:
(setq message-send-mail-function 'smtpmail-send-it)
    ;; smtpmail-stream-type 'starttls
    ;; smtpmail-default-smtp-server "smtp.qq.com"
    ;; smtpmail-smtp-server "smtp.qq.com"
    ;; smtpmail-smtp-service 587 (setq smtpmail-smtp-server "smtp.qq.com")
  (setq smtpmail-smtp-service 25)
  (setq user-full-name "peterzky")
  (setq user-mail-address "peterzky@qq.com")
  ;; 需要在home下新建.authinfo文件，内容如下（都是你作为发件人的信息，你的邮箱地址，你的邮箱密码）：
  ;; machine smtp.qq.com login 邮箱地址 port 25 password 密码明文

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
(setq mu4e-view-show-images t)
(setq mu4e-html2text-command "w3m -T text/html")
