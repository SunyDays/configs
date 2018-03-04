(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(initial-buffer-choice (quote mu4e))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (exwm smart-mode-line nlinum markdown-mode highlight-indent-guides magit nasm-mode lua-mode org highlight-symbol highlight-current-line xcscope)))
 '(scroll-bar-mode nil)
 '(show-paren-mode 1)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "gray20"))))
 '(region ((t (:background "gray20"))))
 '(whitespace-line ((t (:background "black" :foreground "red")))))

(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; set color scheme
(load-theme 'wheatgrass)
;; set font size
(set-face-attribute 'default nil :height 100)
;; disable italic
(set-face-italic 'font-lock-comment-face nil)
;; disable bold
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (ansi-term "/bin/bash")
	    ))

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

;; remap split window shortcuts
(global-set-key (kbd "C-x !") 'delete-other-windows)
(global-set-key (kbd "C-x @") 'split-window-below)
(global-set-key (kbd "C-x #") 'split-window-right)
(global-set-key (kbd "C-x )") 'delete-window)

(require 'highlight-current-line)
(set-face-background 'highlight-current-line-face "gray10")

(require 'xcscope)

(add-hook 'find-file-hook 'highlight-current-line-minor-mode)
(add-hook 'find-file-hook 'nlinum-mode)

(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'cscope-minor-mode)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; change comment symbol for asm-mode
(setq asm-mode-hook
      (lambda () (progn (setq asm-comment-char ?@)
			(setq comment-start "@ ")
			(setq comment-add 0))))

(require 'highlight-symbol)
(global-set-key (kbd "C-S-h") 'highlight-symbol)
(global-set-key (kbd "C-S-n") 'highlight-symbol-next)
(global-set-key (kbd "C-S-p") 'highlight-symbol-prev)

;; ansi-term infinit buffer
(add-hook 'term-mode-hook
	  (lambda ()
	    (setq term-buffer-maximum-size 0)
	    ))

(require 'whitespace)
(setq whitespace-style '(face empty trailing lines-tail
			      space-before-tab::tab space-after-tab::tab))
(setq whitespace-line-column 80)

(setq highlight-symbol-foreground-color "white")

(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-auto-enabled nil)
(set-face-background 'highlight-indent-guides-odd-face "darkgray")
(set-face-background 'highlight-indent-guides-even-face "dimgray")
(set-face-foreground 'highlight-indent-guides-character-face "dimgray")

(setq c-default-style "k&r"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)

(global-set-key "\C-x\C-m" 'compile)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(set-fringe-mode '(nil . 0))
(set-face-background 'fringe "black" nil)

(setq sml/theme 'dark)
(sml/setup)

;;
;; org settings
;;

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-log-into-drawer t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "MAYBE(m)" "INPROGRESS(i!)" "PAUSED(p!)" "|"
		  "DONE(d!)" "FAILED(f!)" "CANCELED(c!)")))
(setq org-agenda-files
   '("~/Documents/org/home.org" "~/Documents/org/habbits.org"))

;;
;; mail settings
;;

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
       ("/my_linux_patches"    . ?p)
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
      mu4e-attachment-dir "~/Downloads/mail"
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

;; markdown
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.bin\\'" . hexl-mode))

;; Open files and go places like we see from error messages, i e: path:line:col
(defadvice find-file (around find-file-line-number
                             (path &optional wildcards)
                             activate)
  "Turn files like file.js:14:10 into file.js and going to line 14, col 10."
  (save-match-data
    (let* ((match (string-match "^\\(.*?\\):\\([0-9]+\\):?\\([0-9]*\\)$" path))
           (line-no (and match
                         (match-string 2 path)
                         (string-to-number (match-string 2 path))))
           (col-no (and match
                        (match-string 3 path)
                        (string-to-number (match-string 3 path))))
           (path (if match (match-string 1 path) path)))
      ad-do-it
      (when line-no
        ;; goto-line is for interactive use
        (goto-char (point-min))
        (forward-line (1- line-no))
        (when (> col-no 0)
          (forward-char (1- col-no)))))))

;; EXWM
;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)
