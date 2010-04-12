;; Global settings
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Custom place to save customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Look & Feel
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq-default indicate-empty-lines t)
(set-scroll-bar-mode 'right)
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control))))

;; Behaviour 
(setq make-backup-files nil)
(windmove-default-keybindings 'meta) ; Move between windows with M-arrows

;; Indentation
(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Modes
(ido-mode)

;; Markdown
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

(defun markdown-to-slideshow ()
  "Convert Markdown to S5 slideshow"
  (interactive)
  (let ((name-root (file-name-sans-extension (buffer-file-name))))
    (shell-command
     (concat "pandoc -w s5 -s -o " name-root ".html " (buffer-file-name)))))


(add-hook 'markdown-mode-hook
          (lambda ()
            (define-key markdown-mode-map "\C-c\C-cs" 'markdown-to-slideshow)))

;; JavaScript
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
