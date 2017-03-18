(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(initial-buffer-choice (quote mu4e))
 '(package-selected-packages
   (quote
    (nasm-mode lua-mode org powerline highlight-symbol highlight-current-line xcscope)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "gray20"))))
 '(region ((t (:background "gray20")))))

(set-face-attribute 'default nil :height 110)

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)

(global-set-key (kbd "<M-up>") 'shrink-window)
(global-set-key (kbd "<M-down>") 'enlarge-window)
(global-set-key (kbd "<M-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<M-right>") 'enlarge-window-horizontally)

(require 'highlight-current-line)
(set-face-background 'highlight-current-line-face "gray10")

(require 'xcscope)

(add-hook 'find-file-hook 'highlight-current-line-minor-mode)
(add-hook 'find-file-hook 'linum-mode)
(add-hook 'find-file-hook 'whitespace-mode)
(add-hook 'find-file-hook 'cscope-minor-mode)
(add-hook 'find-file-hook 'cscope-minor-mode)

(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))

(menu-bar-mode -1)
(show-paren-mode 1)
(scroll-bar-mode -1)

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; (require 'em-tramp)
;; (setq eshell-prefer-lisp-functions t)
;; (setq eshell-prefer-lisp-variables t)
;; (setq password-cache t)
;; (setq password-cache-expiry 120)

;; infinite ansi-term buffer size
(setq term-buffer-maximum-size 0)

(require 'whitespace)
(setq whitespace-style '(face empty trailing lines
			      space-before-tab space-after-tab)
      whitespace-line-column 80)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq c-default-style "k&r"
      c-basic-offset 8
      tab-width 8)

(global-set-key "\C-x\C-m" 'compile)

(set-fringe-mode '(nil . 0))
(set-face-background 'fringe "black" nil)

(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(powerline-default-theme)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-log-into-drawer t)
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS(i!)" "PAUSED(p!)" "|"
		  "DONE(d!)" "CANCELED(c!)")))
(setq org-agenda-files
   '("~/Documents/org/home.org" "~/Documents/org/habbits.org"))

;; mail settings

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(require 'org-mu4e)
(require 'mu4e-maildirs-extension)
(mu4e-maildirs-extension)

(setq mail-user-agent 'mu4e-user-agent)
;; (add-hook 'message-send-hook 'mml-secure-message-sign-pgpmime)

(setq mu4e-maildir "~/Documents/mail/gmail"
      mu4e-drafts-folder "/[Gmail].Drafts"
      mu4e-sent-folder   "/[Gmail].Sent Mail"
      mu4e-trash-folder  "/[Gmail].Trash")

(setq mu4e-maildir-shortcuts
    '( ("/INBOX"               . ?i)
       ("/[Gmail].Sent Mail"   . ?s)
       ("/[Gmail].Trash"       . ?t)
       ("/[Gmail].All Mail"    . ?a)
       ("/[Gmail].Drafts"      . ?d)

       ("/Eudyptula Challenge" . ?e)
       ("/linux_c_programming" . ?p)
       ("/linux_modules"       . ?d)
       ("/github"              . ?g)
       ("/Ioch"                . ?c)
       ("/Mama"                . ?m)
       ("/Mosigra"             . ?o)
       ("/Rocketbank"          . ?r)
       ("/tikets"              . ?k)
       ("/university"          . ?u)
       ("/Weekend_hike"        . ?w)
       ))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 300
      mu4e-html2text-command "html2text"
      mu4e-sent-messages-behavior 'delete
      message-kill-buffer-on-exit t
      mu4e-attachment-dir "~/Downloads"
      mu4e-view-show-addresses 't)

;; something about ourselves
(setq user-mail-address "sunnyddayss@gmail.com"
      user-full-name  "SunyDays")

(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtp-auth-credentials (expand-file-name "~/.authinfo.gpg")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-queue-mail nil
      smtpmail-queue-dir "~/Documents/mail/gmail/queue/cur")
