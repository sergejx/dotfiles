;; Global settings
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Custom place to save customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Look & Feel
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(tool-bar-mode -1) ; no toolbar
(setq-default indicate-empty-lines t)
; Scrolling
(set-scroll-bar-mode 'right)
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control))))
(global-visual-line-mode 1) ; Word wrap


;; Behaviour
(setq make-backup-files nil)
(windmove-default-keybindings 'meta) ; Move between windows with M-arrows

;; Indentation
(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Global settings
(setq require-final-newline t) ; Put newline after last line
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Modes
(ido-mode t)

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

;; Org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; TeX
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'visual-line-mode)
(setq latex-run-command "pdflatex")
(add-hook 'latex-mode-hook '(lambda()
                              (defun tex-view ()
                                (interactive)
                                (tex-send-command "xdg-open"
                                  (tex-append tex-print-file ".pdf")))))
