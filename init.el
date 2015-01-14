;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; general settings ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default indent-tabs-mode nil)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;;; variables
;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(background-color "#fdf6e3")
 '(background-mode light)
 '(column-number-mode t)
 '(cursor-color "#657b83")
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#657b83")
 '(fringe-mode nil nil (fringe))
 '(geiser-mode-auto-p nil)
 '(geiser-mode-autodoc-p nil)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((eval visual-line-mode t))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 97 :width normal)))))
(put 'scroll-left 'disabled nil)

;;;;;;;;;;;;;;;;;;
;;;; packages ;;;;
;;;;;;;;;;;;;;;;;;

(require 'package)

(add-to-list 'package-archives 
    '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives 
    '("MELPA" . "http://melpa.milkbox.net/packages/"))
;; for elpy
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)

;;; currently installed:
;;;;;;;;;;;;;;;;;;;;;;;;

;; find with (remove-duplicates package-activated-list)

(setq my-packages
      '(ac-geiser ac-slime auctex auto-complete-auctex auto-complete chicken-scheme color-theme-solarized color-theme elpy company find-file-in-project geiser gnuplot graphviz-dot-mode haskell-mode highlight-indentation idomenu js2-mode markdown-mode marmalade-demo nodejs-repl org paredit popup prolog pyvenv slime smart-mode-line rich-minority dash yaml-mode yasnippet))

;;;;;;;;;;;;;;;;;;;;;;;
;;;; customization ;;;;
;;;;;;;;;;;;;;;;;;;;;;;

;;; smart-mode-line
;;;;;;;;;;;;;;;;;;;

;; These two lines are just examples
;;(setq powerline-arrow-shape 'curve)
;;(setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
(setq sml/theme 'respectful)
(sml/setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; general editing tools ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; delete-selection-mode
(delete-selection-mode 1)

;;; yasnippet
;;;;;;;;;;;;;

(require 'yasnippet)
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/my-snippets")))
(yas-reload-all)

;;keys for actication
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "M-TAB") 'yas-expand)
;;(define-key yas-minor-mode-map (kbd "M-<tab>") 'yas-expand)

;;keys for navigation
(define-key yas-keymap [(tab)]       nil)
(define-key yas-keymap (kbd "TAB")   nil)
(define-key yas-keymap [(shift tab)] nil)
(define-key yas-keymap [backtab]     nil)
(define-key yas-keymap (kbd "M-TAB") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "M-S-TAB") 'yas-prev)

(yas-global-mode 1)

;;; autocomplete
;;;;;;;;;;;;;;;;

(require 'auto-complete)
;;(global-auto-complete-mode t)
;;(auto-complete-mode t)

;;; paredit
;;;;;;;;;;;

(autoload 'my-enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(defvar electrify-return-match
  "[\]}\)]"
  "If this regexp matches the text after the cursor, do an \"electric\" return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
	(save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(defun my-enable-paredit-mode ()
  (paredit-mode t)
  ;;(local-set-key (kbd "<M-right>") 'paredit-forward-slurp-sexp)
  ;;(local-set-key (kbd "<M-left>") 'paredit-forward-barf-sexp)
  ;;(local-set-key (kbd "<C-right>") 'right-word)
  ;;(local-set-key (kbd "<C-left>") 'left-word)
  ;;(local-set-key (kbd "RET") 'electrify-return-if-match)
  (setq paredit-commands
	(remove-duplicates
	 (append 
	  '((("C-)" "M-<right>")
	     paredit-forward-slurp-sexp
	     ("(foo (bar |baz) quux zot)"
	      "(foo (bar |baz quux) zot)")
	     ("(a b ((c| d)) e f)"
	      "(a b ((c| d) e) f)"))
	    (("C-}" "M-<left>")
	     paredit-forward-barf-sexp
	     ("(foo (bar |baz quux) zot)"
	      "(foo (bar |baz) quux zot)"))
	    (("C-<right>")
	     right-word)
	    (("C-<left>")
	     left-word)
	    (("RET")
	     electrify-return-if-match ())))
	 :test 'equal))
  (paredit-define-keys)
  (paredit-annotate-mode-with-examples)
  (paredit-annotate-functions-with-examples)
  (show-paren-mode t))

(add-hook 'emacs-lisp-mode-hook       #'my-enable-paredit-mode)
;;(add-hook 'eval-expression-minibuffer-setup-hook #'my-enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'my-enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'my-enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'my-enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'my-enable-paredit-mode)
(add-hook 'extempore-mode-hook        #'my-enable-paredit-mode)

;;;;;;;;;;;;;;;;;;;
;;;; extempore ;;;;
;;;;;;;;;;;;;;;;;;;

(autoload 'extempore-mode "~/dateien/src/extempore/extras/extempore.el" "" t)
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))
(setq user-extempore-directory "~/dateien/src/extempore/")
(setq extempore-program-args "--term nocolor")

;;;;;;;;;;;;;;
;;;; lisp ;;;;
;;;;;;;;;;;;;;

;;; slime
;;;;;;;;;

(load (expand-file-name "~/lisp/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
;;(slime-setup '(slime-company))

;;; ac-slime
;;;;;;;;;;;;

(defun my-set-up-slime-ac ()
  (auto-complete-mode t)
  (set-up-slime-ac t) ; enable fuzzy completion (t)
  ;;(set-up-slime-ac) ; no fuzzy completion
  (delete 'ac-source-words-in-same-mode-buffers ac-sources))

;;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(add-hook 'slime-mode-hook 'my-set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'my-set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;;;;;;;;;;;;;;;;;;;;;;;;
;;;; chicken scheme ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/usr/lib/chicken/7/")
(autoload 'chicken-slime "chicken-slime" "SWANK backend for Chicken" t)

(add-hook 'scheme-mode-hook
          (lambda ()
            (slime-mode t)
            ;; disable fuzzy completion here
            (delete 'ac-source-slime-fuzzy ac-sources)))

;;;;;;;;;;;;;;
;;;; node ;;;;
;;;;;;;;;;;;;;

;;(require 'nodejs-repl)

;;;;;;;;;;;;;;;;
;;;; python ;;;;
;;;;;;;;;;;;;;;;

(elpy-enable)

;;;;;;;;;;;;;;;
;;;; latex ;;;;
;;;;;;;;;;;;;;;

(defun my-ac-auctex-startup ()
  (auto-complete-mode t)
  (require 'auto-complete-auctex))
(add-hook 'LaTeX-mode-hook 'my-ac-auctex-startup)

;;;;;;;;;;;;;;;;;;;;
;;;; cheatsheet ;;;;
;;;;;;;;;;;;;;;;;;;;

(defun cheatsheet ()
  (interactive)
  (find-file-other-window "~/.emacs.d/cheatsheet"))
