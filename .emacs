(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
 '(safe-local-variable-values (quote ((chef-mode . t)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(require 'color-theme)
;;(color-theme-initialize)


(setq show-trailing-whitespace t)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'rvm)
(require 'chef-mode)

(add-to-list 'load-path "~/.emacs.d/lisp/git-commit-mode/")
(require 'git-commit)
(add-hook 'git-commit-mode-hook 'turn-on-flyspell)

(add-to-list 'load-path "~/.emacs.d/lisp/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'load-path "~/.emacs.d/lisp/jdee-2.4.1/lisp")
(load "jde")
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 100))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
         (cons 'height (/ (- (x-display-pixel-height) 200)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)
(put 'downcase-region 'disabled nil)

(setq make-backup-files nil)

(setq column-number-mode t)

(setq frame-title-format
  '(:eval
    (if buffer-file-name
        (replace-regexp-in-string
         "\\\\" "/"
         (replace-regexp-in-string
          (regexp-quote (getenv "HOME")) "~"
          (convert-standard-filename buffer-file-name)))
      (buffer-name))))

(global-auto-revert-mode t)

(global-set-key "\C-xp" (lambda ()
                          (interactive)
                          (other-window -1)))

(setq ruby-insert-encoding-magic-comment nil)

(add-to-list 'load-path "~/.emacs.d/lisp/tramp-2.2.10")
(setq tramp-default-method "ssh")

(global-set-key (kbd "<f5>") 'shrink-window-horizontally)
(global-set-key (kbd "<f6>") 'enlarge-window-horizontally)
(global-set-key (kbd "<f7>") 'shrink-window)
(global-set-key (kbd "<f8>") 'enlarge-window)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-d") 'duplicate-line)

(setq user-mail-address "yohan.bismuth1@gmail.com")
(setq user-login-name "yohan.bismuth1@gmail.com")

(add-to-list 'load-path "~/.emacs.d/yaml-mode-master")
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
	  (lambda ()
	    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(add-hook 'json-mode-hook
	  (lambda ()
	    (make-local-variable 'js-indent-level)
	    (setq js-indent-level 2)))

(add-to-list 'load-path "~/.emacs.d/groovy-mode/")
(require 'groovy-mode)
    (add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))

;;Remove '\' wrap character for truncated lines
(set-display-table-slot standard-display-table 'wrap ?\ )

;; Set default fill column length to 100
(setq-default fill-column 100)
