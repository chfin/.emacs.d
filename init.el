(load "~/.emacs.d/machine.el")
(setq ad-redefinition-action 'accept)
(setq lexical-binding t)

;;;;;;;;;;;;;;;;;;
;;;; packages ;;;;
;;;;;;;;;;;;;;;;;;

(require 'package)

;; (add-to-list 'package-archives
;;     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/"))

;; for elpy
;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(setq package-archive-priorities
      '(("gnu"          . 10)
        ("nongnu"       . 9)
        ("melpa"        . 5)
        ("gnu-devel"    . 2)
        ("melpa-stable" . 0)))

(package-initialize)
(package-install 'use-package)
(require 'bind-key)

;;; currently installed:
;;;;;;;;;;;;;;;;;;;;;;;;

;;; variables
;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(TeX-PDF-mode t)
 '(column-number-mode t)
 '(custom-safe-themes
   '("2dc03dfb67fbcb7d9c487522c29b7582da20766c9998aaad5e5b63b5c27eec3f" "a3e99dbdaa138996bb0c9c806bc3c3c6b4fd61d6973b946d750b555af8b7555b" "fc48cc3bb3c90f7761adf65858921ba3aedba1b223755b5924398c666e78af8b" "b77a00d5be78f21e46c80ce450e5821bdc4368abf4ffe2b77c5a66de1b648f10" "569bc616c09c389761622ca5be12031dcd7a0fe4c28b1b7154242812b694318c" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "f56eb33cd9f1e49c5df0080a3e8a292e83890a61a89bceeaa481a5f183e8e3ef" "816bacf37139d6204b761fea0d25f7f2f43b94affa14aa4598bce46157c160c2" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "7aaee3a00f6eb16836f5b28bdccde9e1079654060d26ce4b8f49b56689c51904" "f3455b91943e9664af7998cc2c458cfc17e674b6443891f519266e5b3c51799d" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" default))
 '(fci-rule-character-color "#202020")
 '(fringe-mode nil nil (fringe))
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-log t)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(org-adapt-indentation ''headline-data)
 '(org-agenda-files
   '("~/Uni/phd/notes/graph_grammars.org" "~/Uni/master/notes.org"))
 '(package-selected-packages
   '(all-the-icons-completion all-the-icons vertico forge citar-embark embark-consult embark citar company-reftex ido-mode crdt multiple-cursors lsp-treemacs treemacs-magit treemacs-projectile treemacs dhall-mode psci cargo rust-mode paredit-everywhere diminish eglot company-box lsp-ui company-lsp toml-mode flycheck-rust format-all lsp-haskell lsp-mode nix-haskell-mode dante psc-ide purescript-mode org-ref helm-bibtex intero pandoc-mode yasnippet-snippets company-qml qml-mode zenburn-theme julia-repl zotxt auctex js2-mode haskell-mode flycheck slime yasnippet avy swiper ivy company-lua lua-mode yaml-mode writeroom-mode web-mode use-package undo-tree solarized-theme smart-mode-line slime-company py-autopep8 prolog projectile paredit monokai-theme markdown-mode magit ido-vertical-mode graphviz-dot-mode flx-ido extempore-mode ess ensime elpy ein counsel company-quickhelp company-math company-jedi company-auctex cider ace-window))
 '(safe-local-variable-values
   '((bibtex-completion-bibliography quote
                                     ("~/Uni/phd/notes/references/reading-diary.bib"))
     (cider-shadow-default-options . "app")
     (cider-shadow-default-options . "dev")
     (cider-default-cljs-repl . shadow)
     (format-all-formatters
      ("Haskell" 'ormolu))
     (haskell-process-type . stack-ghci)
     (cider-clojure-cli-global-options . "-A:fig")
     (enable-format-all . t)
     (cider-figwheel-main-default-options . "dev")
     (cider-figwheel-main-default-options . ":cider")
     (cider-default-cljs-repl . figwheel-main)
     (cider-clojure-cli-global-options . "-A:cider")
     (cider-clojure-cli-global-options . -A:fig)
     (TeX-command-extra-options . "-shell-escape")
     (intero-targets "musicology:lib" "musicology:exe:musicology-exe" "musicology:test:musicology-test" "musicology:bench:musicology-bench")
     (eval yas-activate-extra-mode 'overtone-mode)
     (eval visual-line-mode t)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(split-height-threshold nil)
 '(split-width-threshold 190)
 '(tool-bar-mode nil)
 '(writeroom-width 100))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 110 :width normal)))))
(put 'scroll-left 'disabled nil)

;; '(term-default-bg-color "#fdf6e3")
;; '(term-default-fg-color "#657b83")

;;;;;;;;;;;;;;;;;;;;;;;
;;;; customization ;;;;
;;;;;;;;;;;;;;;;;;;;;;;

;;; font
;;;;;;;;

(set-face-font 'default
               (cond
                ((equal machine-name :chfin-dcml) "DejaVu Sans Mono-15")
                ((equal machine-name :chfin-tp)   "DejaVu Sans Mono-10")))
;; (set-face-attribute 'default nil :height 170)

(defun toggle-show-trailing-whitespace ()
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace)))
; (setq-default show-trailing-whitespace t)

;;; themes
;;;;;;;;;;

(use-package monokai-theme :ensure t
	     :defer t)
(use-package solarized-theme :ensure t
  :defer t)
(use-package zenburn-theme :ensure t
  :pin melpa)

(load-theme 'zenburn)

(use-package all-the-icons :ensure t
  :if (display-graphic-p))

;;; smart-mode-line
;;;;;;;;;;;;;;;;;;;

;;; load smart-mode-line
(use-package smart-mode-line :ensure t
  :config
  ;;(setq powerline-default-separator 'wave)
  (setq sml/theme 'respectful) ;; or powerline
  (sml/setup)
  (set-face-attribute 'mode-line nil :box nil)
  (set-face-attribute 'mode-line-inactive nil :box nil))


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; general settings ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; put backups in a meaningful place
(setq
 backup-by-copying-when-linked t  ; don't clobber symlinks
 backup-directory-alist
 '(("" . "~/.emacs.d/backups"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t                ; use versioned backups
 vc-make-backup-files t
 backup-enable-predicate
 (lambda (name)
   (and (normal-backup-enable-predicate name)
        (not
         (let ((method (file-remote-p name 'method)))
           (when (stringp method)
             (member method '("su" "sudo")))))))
 ;; performance settings
 gc-cons-threshold 100000000
 read-process-output-max (* 1024 1024))

;; auth-source
(setq auth-sources '("~/.authinfo.gpg"))

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; delete-selection-mode
(delete-selection-mode 1)

;; key bindings
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "s-k") 'kill-buffer)
;; (global-set-key (kbd "s-b") 'ivy-switch-buffer)
;; (global-set-key (kbd "s-k") 'ido-kill-buffer)
;; (global-set-key (kbd "C-x C-f") 'ido-find-file)

;; deprecate key bindings
(global-set-key (kbd "C-x o") (lambda () (interactive) (message "deprecated, use M-o or s-o instead.")))
(global-set-key (kbd "C-x b") (lambda () (interactive) (message "deprecated, use s-b instead.")))
(global-set-key (kbd "C-x k") (lambda () (interactive) (message "deprecated, use s-k instead.")))
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-x C-z") nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; useful general packages ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; diminish
;;;;;;;;;;;;

(use-package diminish :ensure t
  :config
  (diminish 'eldoc-mode))

;;; undo-tree
;;;;;;;;;;;;;

(use-package undo-tree :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

;;; ace-jump
;;;;;;;;;;;;

(use-package ace-jump-mode :ensure t
  :disabled ;; in favour of avy
  :bind (("C-;" . ace-jump-mode)))

;;; projectile
;;;;;;;;;;;;;;

(use-package projectile :ensure t
  :pin melpa
  :diminish " proj"
  :init
  (projectile-mode)
  :config
  (add-to-list 'projectile-globally-ignored-file-suffixes "~")
  (add-to-list 'projectile-globally-ignored-file-suffixes "#")
  (setq projectile-dynamic-mode-line nil))

;;; ido
;;;;;;;

;; (use-package ido :ensure t
;;   :init
;;   (ido-mode t)
;;   (setq ido-everywhere t)
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-use-faces nil)
;;   ;; disable fancy matching when trying to create a new file:
;;   (setq ido-auto-merge-work-directories-length -1))

;; (use-package flx-ido :ensure t
;;   :init
;;   (flx-ido-mode 1))

;; (use-package ido-vertical-mode :ensure t
;;   :init
;;   (ido-vertical-mode 1))

;;; vertico/orderless/marginals/consult
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vertico :ensure t
  :init
  (vertico-mode)
  (setq vertico-cycle t))

(use-package vertico-directory :ensure nil ; part of vertico
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless :ensure t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package consult :ensure t
  :bind (("C-s" . consult-line)
         ("s-b" . consult-buffer))
  :init (recentf-mode)
  :config
  ;; disable automatic preview for all commands involving files
  (consult-customize
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-recent-file
   consult--source-project-recent-file
   :preview-key (kbd "M-.")))

(use-package marginalia :ensure t
  :init (marginalia-mode))

;; add icons to marginalia
(use-package all-the-icons-completion :ensure t
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(use-package embark :ensure t
  :bind
  (("C-." . embark-act)
   ("C-," . embark-dwim))
  :init
  ;; replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult :ensure t
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;;; avy (instead of ace-jump-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package avy :ensure t
  :bind
  (("C-;" . avy-goto-word-or-subword-1)))

(use-package ace-window :ensure t
  :bind
  (("s-o" . ace-window)))

;;; yasnippet
;;;;;;;;;;;;;

(use-package yasnippet :ensure t
  ;;:disabled
  ;;:commands (yas-minor-mode)
  ;;:init
  ;;(add-hook 'prog-mode-hook #'yas-minor-mode)
  :diminish yas-minor-mode

  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs (append yas-snippet-dirs '("~/.emacs.d/my-snippets")))
  (yas-reload-all)

  :bind
  ;; rebind everything to M-<tab> / M-S-<tab>
  (:map yas-minor-mode-map
        ("<tab>" . nil)
        ("TAB" . nil)
        ("M-TAB" . yas-expand)
        :map yas-keymap
        ("<tab>" . nil)
        ("TAB" . nil)
        ("S-<tab>" . nil)
        ("S-TAB" . nil)
        ("<backtab>" . nil)
        ("M-<tab>" . yas-next-field-or-maybe-expand)
        ("M-S-<tab>" . yas-prev)))

(use-package yasnippet-snippets :ensure t)

;;; auto-complete
;;;;;;;;;;;;;;;;;
;; disabled for company

(use-package auto-complete :ensure t
  :disabled)

;;; company
;;;;;;;;;;;

(defun company-mode/backend-with-yas (backend)
  (if (and (listp backend) (member 'company-yasnippet backend))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(use-package company :ensure t
  :pin melpa
  :diminish ""
  :init
  (global-company-mode)
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  (setq company-dabbrev-downcase nil)
  :config (setq company-idle-delay 0.3))

(use-package company-box :ensure t
  :diminish ""
  :hook (company-mode . company-box-mode))

(use-package company-quickhelp :ensure t
  :diminish ""
  :config
  (company-quickhelp-mode t))

;;; code formatting
;;;;;;;;;;;;;;;;;;;

(use-package format-all :ensure t
  :diminish "fmt"
  :config
  (push '("PureScript" purs-tidy) format-all-default-formatters)
  (push '("Haskell" fourmolu) format-all-default-formatters)
  :hook
  (format-all-mode . format-all-ensure-formatter))

;;; paredit
;;;;;;;;;;;

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

(use-package paredit :ensure t
  :defer t
  :diminish "()"

  :init
  (add-hook 'emacs-lisp-mode-hook       #'paredit-mode)
  ;;(add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook             #'paredit-mode)
  (add-hook 'lisp-mode-hook             #'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'scheme-mode-hook           #'paredit-mode)

  :bind (:map paredit-mode-map
              ("M-<right>" . paredit-forward-slurp-sexp)
              ("M-<left>" . paredit-forward-barf-sexp)
              ("C-<right>" . right-word)
              ("C-<left>" . left-word)
              ("RET" . electrify-return-if-match)))

(use-package paredit-everywhere :ensure t
  :diminish ()
  :hook (prog-mode . paredit-everywhere-mode))

;;; multiple cursors
;;;;;;;;;;;;;;;;;;;;

(use-package multiple-cursors :ensure t
  :pin melpa
  :bind
  (:map global-map
        ("C-c m c" . mc/edit-lines)))

;;; flyspell
;;;;;;;;;;;;

(use-package flyspell
  :commands (activate-flyspell flyspell-mode)

  :init
  (setq flyspell-issue-message-flag nil)
  (setq flyspell-use-meta-tab nil)
  (defun activate-flyspell ()
    (interactive)
    (ispell-change-dictionary "american")
    (flyspell-mode t)
    (flyspell-buffer)
    ;;(define-key flyspell-mode-map "C-M-i" nil)
    )
  )

;;; treemacs
;;;;;;;;;;;;

(use-package treemacs :ensure t
  :pin melpa
  :defer t
  :bind
  (:map global-map
        ("s-t" . treemacs)))

(use-package treemacs-projectile :ensure t
  :pin melpa
  :after (treemacs projectile))

(use-package treemacs-magit :ensure t
  :pin melpa
  :after (treemacs magit))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; programming modes ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; general: language server protocol (lsp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lsp-mode :ensure t
  :pin melpa
  :diminish "lsp"
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-modeline-code-actions-segments '(count))
  (diminish 'flycheck-mode))

(use-package lsp-ui :ensure t
  :pin melpa
  :config
  (diminish 'lsp-lens-mode)
  (setq lsp-ui-doc-position 'top)
  (setq lsp-ui-sideline-ignore-duplicate t)
  (setq lsp-ui-sideline-show-symbol nil)
  :hook
  (lsp-mode . lsp-ui-mode)
  ;(lsp-mode . lsp-lens-mode)
  (lsp-ui-mode . (lambda ()
                   (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
                   (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))))

(use-package lsp-treemacs :ensure t
  :pin melpa
  :after (treemacs lsp))

;;; extempore
;;;;;;;;;;;;;

(use-package extempore-mode :ensure t
  :defer t
  :config
  (setq user-extempore-directory "~/dateien/src/extempore/")
  (add-hook 'extempore-mode-hook #'paredit-mode))

;;; common lisp
;;;;;;;;;;;;;;;

(use-package slime :ensure t
  :defer t
  :config
  (setq inferior-lisp-program "sbcl")
  (setq slime-contribs '(slime-fancy slime-quicklisp slime-company))
  (add-hook 'slime-mode-hook #'paredit-mode)
  (add-hook 'slime-repl-mode-hook #'paredit-mode))

(use-package slime-company :ensure t
  :after slime)

;;;; clojure
;;;;;;;;;;;;

(defun cider-mode-stuff ()
  (paredit-mode t)
  (eldoc-mode t))

(use-package cider :ensure t
  :defer t
  :config
  (setq cider-lein-command "~/.bin/lein")
  ;;(setq cider-repl-use-pretty-printing t)

  (add-hook 'cider-repl-mode-hook #'cider-mode-stuff)
  (add-hook 'cider-mode-hook #'cider-mode-stuff)
  (add-hook 'clojure-mode-hook #'paredit-mode))

;;; python
;;;;;;;;;;

(use-package lsp-pyright :ensure t
  :defer t
  :config
  (setq lsp-clients-python-library-directories '("/usr/" "~/miniconda3/pkgs"))
  (setq ;; lsp-pyright-disable-language-service nil
	;; lsp-pyright-disable-organize-imports nil
	;; lsp-pyright-auto-import-completions t
	lsp-pyright-use-library-code-for-types t
	;; lsp-pyright-venv-path "~/miniconda3/envs"
        lsp-pyright-stub-path "~/dateien/src/python-type-stubs")
  :hook ((python-mode . (lambda () 
                          (require 'lsp-pyright)
                          (lsp)))))

;; old config:

;; (use-package flycheck :ensure t
;;   :pin melpa
;;   :diminish ""
;;   :after elpy)

;; (use-package py-autopep8 :ensure t
;;   :after elpy
;;   :init (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

;; (use-package company-jedi :ensure t
;;   :after elpy)

;; (use-package elpy :ensure t
;;   :commands (elpy-enable)
;;   :config
;;   (add-hook 'elpy-mode-hook
;;             (lambda ()
;;               ;;(highlight-indentation-mode nil)
;;               (add-to-list 'company-backends 'company-jedi)))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules)))

;;; julia/ESS
;;;;;;;;;;;;;

(use-package julia-mode :ensure t
  :pin melpa
  :defer t)

(use-package julia-repl :ensure t
  :pin melpa
  :after julia-mode
  :hook (julia-mode . julia-repl-mode))

(use-package julia-img-view
  :load-path "/home/chfin/dateien/src/julia-img-view/"
  :after julia-repl
  :config (julia-img-view-setup))

;; (require 'julia-mode)

;;; haskell
;;;;;;;;;;;

(use-package haskell-mode :ensure t
  :pin melpa
  :defer t
  :hook
  (haskell-mode . haskell-indentation-mode)
  (haskell-mode . (lambda ()
                    (interactive-haskell-mode 1)
                    (diminish 'interactive-haskell-mode ">>=")
                    (define-key interactive-haskell-mode-map (kbd "M-.") nil)))
  (haskell-mode . lsp))

(use-package nix-haskell-mode :ensure t
  :after haskell-mode)

(use-package lsp-haskell :ensure t)

;;; purescript
;;;;;;;;;;;;;;

(use-package purescript-mode :ensure t
  :pin melpa
  :defer t
  :diminish "<≡>"
  :hook
  (purescript-mode . lsp)
  (purescript-mode . inferior-psci-mode)
  (purescript-mode . turn-on-purescript-indentation))

(use-package psc-ide :ensure t
  :disabled
  :pin melpa
  :defer t
  :after purescript-mode
  :diminish "<≡>"
  :init (add-hook 'purescript-mode-hook
                  (lambda ()
                    (psc-ide-mode)
                    (company-mode)
                    (flycheck-mode)
                    (turn-on-purescript-indentation)))
  :bind (:map psc-ide-mode-map
              ("C-c C-r" . psc-ide-load-all)
              ("C-c C-l" . nil)))

(use-package psci :ensure t
  :pin melpa
  :defer t
  :after purescript-mode
  :diminish "")

;;; rust
;;;;;;;;

(use-package rust-mode :ensure t :pin melpa
  :hook (rust-mode . lsp))

(use-package cargo :ensure t :pin melpa
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust :ensure t :pin melpa
  :hook (flycheck-mode . flycheck-rust-setup))

;;; scala
;;;;;;;;;

(use-package ensime
  :ensure t
  :pin melpa-stable
  :defer t)

;;; javascript
;;;;;;;;;;;;;;

(use-package js2-mode :ensure t
  :mode "\\.js\\'"
  :config
  (setq js2-basic-offset 2))

(use-package qml-mode :ensure t
  :defer t)

;;; prolog
;;;;;;;;;;

(use-package prolog :ensure t
  :defer t)

;;; web-dev
;;;;;;;;;;;

(use-package web-mode :ensure t
  :defer t)

;;; lua
;;;;;;;

(use-package lua-mode :ensure t
  :pin melpa
  :defer t)
(use-package company-lua :ensure t
  :after lua-mode)

;;;;;;;;;;;;;;;;;;;;
;;;; text modes ;;;;
;;;;;;;;;;;;;;;;;;;;

;;; latex
;;;;;;;;;

(use-package tex :ensure auctex
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))
  (setq TeX-parse-self t)
  (add-hook 'TeX-mode-hook
            (lambda ()
              ;;(company-auctex-init)
              (setq-local company-backends
                          (append '(company-reftex-labels company-reftex-citations company-math-symbols-latex company-latex-commands)
                                  company-backends))
              (turn-on-reftex)
              (setq reftex-plug-into-AUCTeX t))))

(use-package company-math :ensure t
  :after auctex)

(use-package company-auctex :ensure t
  :after auctex)

(use-package company-reftex :ensure t
  :after auctex)

;;; org mode
;;;;;;;;;;;;

(use-package org :ensure t
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :hook (org-mode . (lambda () (electric-indent-local-mode -1)))
  :custom
  (org-cite-csl-styles-dir (expand-file-name "~/Zotero/styles/"))
  :config
  (progn
    (require 'oc-csl)
    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil))
    (add-to-list 'org-latex-classes
                 ;; list of notes
                 '("notes"
                   "\\documentclass[a4paper,10pt,DIV=12]{scrartcl}\n
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
%\\usepackage{libertine}
%\\renewcommand*\\oldstylenums[1]{{\\fontfamily{fxlj}\\selectfont #1}}
%\\usepackage{lmodern}
\\usepackage{hyperref}
\\usepackage{color}
\\usepackage{rotate}
\\usepackage{textcomp}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((lilypond . t)
       (org . t)))
    (setq org-confirm-babel-evaluate nil)
    (setq org-latex-pdf-process
          '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"))))

(use-package ob-lilypond
  :after org)

(use-package citar :ensure t
  :no-require
  :custom
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  ;; optional: org-cite-insert is also bound to C-c C-x C-@
  :bind
  (:map org-mode-map :package org ("C-c b" . #'org-cite-insert))
  :config
  (setq citar-symbols
        `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
          (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
          (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
  (setq citar-symbol-separator "  "))

(use-package citar-embark :ensure t
  :after citar embark
  :no-require
  :config (citar-embark-mode))

;;; markdown
;;;;;;;;;;;;

(use-package pandoc-mode :ensure t
  :defer t)

(use-package markdown-mode :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc -s")
  (add-hook 'markdown-mode-hook 'pandoc-mode))

;;; graphviz
;;;;;;;;;;;;

(use-package graphviz-dot-mode :ensure t
  :defer t)

;;; yaml
;;;;;;;;

(use-package yaml-mode :ensure t)

;;; toml
;;;;;;;;

(use-package toml-mode :ensure t)

;;; dhall
;;;;;;;;;

(use-package dhall-mode :ensure t)

;;; lilypond
;;;;;;;;;;;;

(use-package lilypond-mode
  :mode (("\\.ly$" . LilyPond-mode)
         ("\\.ily$" . LilyPond-mode))
  :commands (LilyPond-mode)

  :init
  (add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

  :config
  (setq LilyPond-include-path "/home/chfin/dateien/src/openlilylib-snippets/")
  (setq LilyPond-lilypond-command (concat "lilypond --include=" LilyPond-include-path))
  (setq LilyPond-pdf-command "xdg-open")
  (setq LilyPond-ps-command "xdg-open")
  (setq LilyPond-command-alist
        `(("LilyPond" . (,(concat LilyPond-lilypond-command " %s") "%s" "%l" "View"))
          ("2PS" . (,(concat LilyPond-lilypond-command " -f ps %s") "%s" "%p" "ViewPS"))
          ("Book" . ("lilypond-book %x" "%x" "%l" "LaTeX"))
          ("LaTeX" . ("latex '\\nonstopmode\\input %l'" "%l" "%d" "ViewDVI"))

          ;; refreshes when kicked USR1
          ("View" . (,(concat LilyPond-pdf-command " %f")))
          ("ViewPDF" . (,(concat LilyPond-pdf-command " %f")))
          ("ViewPS" . (,(concat LilyPond-ps-command " %p")))

          ;; The following are refreshed in LilyPond-command:
          ;; - current-midi depends on cursor position and
          ("Midi" . (""))               ;
          ;; - all-midi depends on number of midi-score.
          ("MidiAll" . ("")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; special task modes ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ein: emacs ipython/jupyter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ein :ensure t
  :defer t
  :pin melpa
  :commands (ein:notebooklist-open ein:notebooklist-login))

;;; magit
;;;;;;;;;

(use-package magit :ensure t
  :bind
  ("C-x g" . magit-status))

(use-package forge :ensure t
  :after magit)

;;; writeroom-mode
;;;;;;;;;;;;;;;;;;

(use-package writeroom-mode :ensure t
  :commands (writeroom-mode global-writeroom-mode))

;;; crdt.el / collaborative editing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package crdt :ensure t
  :defer t
  :commands (crdt-share-buffer crdt-connect))

;;; pdf-tools
;;;;;;;;;;;;;

;; (use-package pdf-tools :ensure t
;;   :config
;;   (pdf-tools-install)
;;   (setq pdf-annot-activate-created-annotations t))

;;;;;;;;;;;;;;;;;;;;
;;;; cheatsheet ;;;;
;;;;;;;;;;;;;;;;;;;;

(defun cheatsheet ()
  (interactive)
  (find-file-other-window "~/.emacs.d/cheatsheet"))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
