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
 '(initial-buffer-choice (quote eshell))
 '(package-selected-packages
   (quote
    (powerline highlight-symbol highlight-current-line xcscope)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "gray20"))))
 '(region ((t (:background "gray20")))))

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

(add-hook 'find-file-hook 'highlight-current-line-minor-mode)
(add-hook 'find-file-hook 'linum-mode)
(add-hook 'find-file-hook 'whitespace-mode)
(add-hook 'find-file-hook 'cscope-minor-mode)

(menu-bar-mode -1)
(show-paren-mode 1)
(scroll-bar-mode -1)

(require 'xcscope)

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(require 'em-tramp)
(setq eshell-prefer-lisp-functions t)
(setq eshell-prefer-lisp-variables t)
(setq password-cache t)
(setq password-cache-expiry 120)

(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq c-default-style "k&r"
      c-basic-offset 8)

(global-set-key "\C-x\C-m" 'compile)

(set-fringe-mode '(nil . 0))
(set-face-background 'fringe "black" nil)

(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(powerline-default-theme)
