(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(initial-buffer-choice (quote mu4e))
 '(magit-commit-arguments (quote ("--signoff")))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (exec-path-from-shell multiple-cursors org-page emojify-logos google-this google-translate md4rd pdf-tools autopair wttrin xkcd symon fireplace magithub emojify mu4e-maildirs-extension exwm smart-mode-line nlinum markdown-mode highlight-indent-guides magit nasm-mode lua-mode org highlight-symbol highlight-current-line xcscope)))
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
 '(which-func ((t (:foreground "dark orange" :underline nil))))
 '(whitespace-line ((t (:background "black" :foreground "red")))))

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)

(require 'use-package)

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

;; smart-mode-line
(setq sml/theme 'dark)
(sml/setup)

(setq display-time-24hr-format 1)
(display-time-mode 1)

(require 'symon)
(setq symon-sparkline-width '250)
(setq symon-sparkline-thickness '1)
(setq symon-refresh-rate '2)
(setq symon-history-size '100)
(setq symon-sparkline-type 'boxed)
(setq symon-delay '5)
(symon-mode)

(require 'xkcd)

(require 'wttrin)
(setq wttrin-default-cities '("Moscow"))
(setq wttrin-default-accept-language '("Accept-Language" . "en-EN"))

(require 'autopair)
(autopair-global-mode)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (ansi-term "/bin/bash")
	    ))
;; ansi-term infinit buffer
(add-hook 'term-mode-hook
	  (lambda ()
	    (setq term-buffer-maximum-size 0)
	    ))

(setq shr-color-visible-luminance-min 100)
(setq browse-url-browser-function 'eww-browse-url)

(pdf-tools-install)

(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

(require 'google-translate)
(require 'google-translate-smooth-ui)
(global-set-key (kbd "C-c t") 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist '(("en" . "ru")))

(require 'google-this)
(google-this-mode 1)

;; (desktop-save-mode t)

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

;; global nlinum-mode except terminal
(define-global-minor-mode my-nlinum-mode nlinum-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'term-mode 'shell-mode)))
      (nlinum-mode))))
(my-nlinum-mode 1)

;; global highlight-current-line-mode except terminal and tramp
(define-global-minor-mode my-highlight-current-line-minor-mode highlight-current-line-minor-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'term-mode 'shell-mode 'tramp-mode)))
      (highlight-current-line-minor-mode))))
(my-highlight-current-line-minor-mode 1)

;; disable highlight-current-line-mode in minibuffer
(defun my-turn-off-highlight-current-line-minor-mode ()
  (highlight-current-line-minor-mode nil))
(add-hook 'minibuffer-setup-hook 'my-turn-off-highlight-current-line-minor-mode)

;; global emojify-mode except terminal and prog-mode
(define-global-minor-mode my-emojify-mode emojify-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'term-mode 'shell-mode 'prog-mode)))
      (emojify-mode))))
(my-emojify-mode 1)

(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'cscope-minor-mode)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'prog-mode-hook 'which-function-mode)

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

(global-set-key (kbd "C-c m") 'compile)

(global-set-key (kbd "C-c f") 'follow-mode)

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

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(use-package magithub
	     :after magit
	     :config
	     (magithub-feature-autoinject t)
	     (setq magithub-clone-default-directory "~/Documents/projects"))

(set-fringe-mode '(nil . 0))
(set-face-background 'fringe "black" nil)

;; org settings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(setq org-log-done t)
(setq org-log-into-drawer t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "MAYBE(m)" "INPROGRESS(i!)" "PAUSED(p!)" "|"
		  "DONE(d!)" "FAILED(f!)" "CANCELED(c!)")))
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

;; org-page
(require 'org-page)
(setq op/repository-directory "~/Documents/projects/sunydays_blog")
(setq op/site-domain "http://SunyDays.github.io/")
(setq op/site-main-title "To Suffer Again for this Rubbish")
(setq op/site-sub-title "SunyDays Blog")
(setq op/personal-github-link "https://github.com/SunyDays")
(setq op/theme 'mdo)
(setq op/personal-avatar "https://avatars0.githubusercontent.com/u/6206850?s=460&v=4")
(setq op/category-config-alist
      '(("blog" ;; this is the default configuration
	 :show-meta t
	 :show-comment t
	 :uri-generator op/generate-uri
	 :uri-template "/blog/%y/%m/%d/%t/"
	 :sort-by :date     ;; how to sort the posts
	 :category-index t) ;; generate category index or not
	("index"
	 :show-meta nil
	 :show-comment nil
	 :uri-generator op/generate-uri
	 :uri-template "/"
	 :sort-by :date
	 :category-index nil)
	("about"
	 :show-meta nil
	 :show-comment nil
	 :uri-generator op/generate-uri
	 :uri-template "/about/"
	 :sort-by :date
	 :category-index nil)))
