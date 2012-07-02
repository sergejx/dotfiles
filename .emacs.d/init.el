;; Packages ------------
(require 'package)
(add-to-list 'package-archives
             '("marmelade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(starter-kit starter-kit-bindings starter-kit-lisp starter-kit-js
                markdown-mode haskell-mode magit
                solarized-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Global settings
(add-to-list 'load-path "~/.emacs.d")
(setq-default ispell-program-name "aspell")
(load "kbd/slovak.el")

;; Custom place to save customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Look & Feel
(setq-default indicate-empty-lines t)
; Scrolling
(set-scroll-bar-mode 'right)
;(setq scroll-step 1)
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control))))
;(global-visual-line-mode 1) ; Word wrap
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(load-theme 'solarized-light t)

;; Behaviour
(setq make-backup-files nil)
(windmove-default-keybindings 'meta) ; Move between windows with M-arrows

;; Indentation
(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Global settings
(setq require-final-newline t) ; Put newline after last line
;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Markdown
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(defun markdown-to-slideshow ()
  "Convert Markdown to S5 slideshow"
  (interactive)
  (let ((name-root (file-name-sans-extension (buffer-file-name))))
    (shell-command
     (concat "pandoc -w s5 -s -o " name-root ".html " (buffer-file-name)))))

(add-hook 'markdown-mode-hook
          (lambda ()
            (define-key markdown-mode-map "\C-c\C-cs" 'markdown-to-slideshow)))

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
