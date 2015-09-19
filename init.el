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
;; M-x eval-print-last-sexp

(setq my-packages
      '(ac-geiser ac-slime ace-jump-mode auto-complete chicken-scheme cider clojure-mode company-auctex auctex company-math company-quickhelp elpy company find-file-in-project geiser gnuplot graphviz-dot-mode haskell-mode highlight-indentation ido-ubiquitous ido-completing-read+ ido-vertical-mode idomenu js2-mode markdown-mode math-symbol-lists monokai-theme no-easy-keys nodejs-repl org paredit popup pos-tip projectile pkg-info epl prolog pyvenv queue s slime smart-mode-line rich-minority smex solarized-theme dash spinner undo-tree yaml-mode yasnippet zenburn-theme))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; general settings ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default indent-tabs-mode nil)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)
(ido-vertical-mode 1)

;;(load-theme 'monokai t)

;;; smex
;;;;;;;;

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; variables
;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(TeX-PDF-mode t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(ansi-term-color-vector
   [unspecified "#110F13" "#b13120" "#719f34" "#ceae3e" "#7c9fc9" "#7868b5" "#009090" "#F4EAD5"])
 '(background-color "#fdf6e3")
 '(background-mode light)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#657b83")
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" default)))
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#383838")
 '(foreground-color "#657b83")
 '(fringe-mode nil nil (fringe))
 '(geiser-mode-auto-p nil)
 '(geiser-mode-autodoc-p nil)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 ;; '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 ;; '(highlight-symbol-colors
 ;;   (--map
 ;;    (solarized-color-blend it "#fdf6e3" 0.25)
 ;;    (quote
 ;;     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 ;; '(highlight-symbol-foreground-color "#586e75")
 ;; '(highlight-tail-colors
 ;;   (("#49483E" . 0)
 ;;    ("#67930F" . 20)
 ;;    ("#349B8D" . 30)
 ;;    ("#21889B" . 50)
 ;;    ("#968B26" . 60)
 ;;    ("#A45E0A" . 70)
 ;;    ("#A41F99" . 85)
 ;;    ("#49483E" . 100)))
 ;; '(hl-bg-colors
 ;;   (quote
 ;;    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 ;; '(hl-fg-colors
 ;;   (quote
 ;;    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#1e1e1e")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(powerline-color1 "#1e1e1e")
 '(powerline-color2 "#111111")
 '(safe-local-variable-values (quote ((eval visual-line-mode t))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 97 :width normal)))))
(put 'scroll-left 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;
;;;; customization ;;;;
;;;;;;;;;;;;;;;;;;;;;;;

;;; highlight whole region between parens
;;(setq show-paren-style 'expression)

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

;;; undo-tree
(global-undo-tree-mode)

;;; ace-jump
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

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
;;(setq extempore-program-args "--term nocolor")

;;;;;;;;;;;;;;;;;;;;;
;;; supercollider ;;;
;;;;;;;;;;;;;;;;;;;;;

(autoload 'sclang-start "sclang" "" t)

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

;;;;;;;;;;;;;;;;;
;;;; clojure ;;;;
;;;;;;;;;;;;;;;;;

(company-quickhelp-mode 1)

(setq cider-lein-command "~/.bin/lein")
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'clojure-mode-hook #'my-enable-paredit-mode)
(add-hook 'cider-repl-mode-hook #'my-enable-paredit-mode)
(add-hook 'cider-mode-hook #'my-enable-paredit-mode)

;;;;;;;;;;;;;;
;;;; node ;;;;
;;;;;;;;;;;;;;

;;(require 'nodejs-repl)

;;;;;;;;;;;;;;;;
;;;; python ;;;;
;;;;;;;;;;;;;;;;

(elpy-enable)

(add-hook 'elpy-mode-hook
          (lambda ()
            (define-key yas-minor-mode-map (kbd "<tab>") 'yas-expand)
            (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
            (highlight-indentation-mode nil)))

;;;;;;;;;;;;;;;
;;;; latex ;;;;
;;;;;;;;;;;;;;;

(defun my-auctex-startup ()
  (company-mode t)
  (setq-local company-backends
              (append '(company-math-symbols-latex company-latex-commands)
                      company-backends))
  (company-auctex-init))
(add-hook 'TeX-mode-hook 'my-auctex-startup)

;;;;;;;;;;;;;;;;;;;;
;;;; cheatsheet ;;;;
;;;;;;;;;;;;;;;;;;;;

(defun cheatsheet ()
  (interactive)
  (find-file-other-window "~/.emacs.d/cheatsheet"))
(put 'downcase-region 'disabled nil)
