(load "~/.emacs.d/machine.el")
(setq ad-redefinition-action 'accept)

;;;;;;;;;;;;;;;;;;
;;;; packages ;;;;
;;;;;;;;;;;;;;;;;;

(require 'package)

;; (add-to-list 'package-archives
;;     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; for elpy
;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(setq package-archive-priorities
      '(("melpa-stable" . 10)
        ("gnu"          . 5)
        ("melpa"        . 0)))

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
   '("e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "f56eb33cd9f1e49c5df0080a3e8a292e83890a61a89bceeaa481a5f183e8e3ef" "816bacf37139d6204b761fea0d25f7f2f43b94affa14aa4598bce46157c160c2" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "7aaee3a00f6eb16836f5b28bdccde9e1079654060d26ce4b8f49b56689c51904" "f3455b91943e9664af7998cc2c458cfc17e674b6443891f519266e5b3c51799d" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" default))
 '(fci-rule-character-color "#202020")
 '(fringe-mode nil nil (fringe))
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-log t)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(lsp-ui-doc-position 'top)
 '(lsp-ui-sideline-ignore-duplicate t)
 '(lsp-ui-sideline-show-symbol nil)
 '(org-agenda-files
   '("~/Uni/phd/notes/graph_grammars.org" "~/Uni/master/notes.org"))
 '(package-selected-packages
   '(paredit-everywhere diminish eglot company-box lsp-ui company-lsp toml-mode flycheck-rust cargo rust-mode format-all lsp-haskell lsp-mode nix-haskell-mode dante psc-ide purescript-mode org-ref pandoc-mode yasnippet-snippets company-qml qml-mode zotxt auctex haskell-mode flycheck company avy company-lua py-autopep8 prolog paredit monokai-theme ido-vertical-mode graphviz-dot-mode flx-ido extempore-mode ess ensime elpy ein counsel company-quickhelp company-math company-jedi company-auctex cider ace-window))
 '(safe-local-variable-values
   '((haskell-process-type . stack-ghci)
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
                ((equal machine-name :chfin-dcml) "DejaVu Sans Mono-16")
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
             (member method '("su" "sudo"))))))))



;; use tabs
(setq-default indent-tabs-mode nil)

;; delete-selection-mode
(delete-selection-mode 1)

;; key bindings
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "s-b") 'ivy-switch-buffer)
(global-set-key (kbd "s-k") 'ido-kill-buffer)


;; deprecate key bindings
(setq lexical-binding t)
(defun warn-key (msg)
  (lambda ()
    (interactive)
    (message msg)))
(setq lexical-binding nil)
(global-set-key (kbd "C-x o") (warn-key "deprecated, use M-o or s-o instead."))
(global-set-key (kbd "C-x b") (warn-key "deprecated, use s-b instead."))
(global-set-key (kbd "C-x k") (warn-key "deprecated, use s-k instead."))
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-x C-z") nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; useful general packages ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; diminish
;;;;;;;;;;;;

(use-package diminish :ensure t)

;;; undo-tree
;;;;;;;;;;;;;

(use-package undo-tree :ensure t
  :diminish undo-tree-mode
  :config (global-undo-tree-mode))

;;; ace-jump
;;;;;;;;;;;;

(use-package ace-jump-mode :ensure t
  :disabled ;; in favour of avy
  :bind (("C-;" . ace-jump-mode)))

;;; projectile
;;;;;;;;;;;;;;

(use-package projectile :ensure t
  :init
  (projectile-mode)
  :config
  (add-to-list 'projectile-globally-ignored-file-suffixes "~")
  (add-to-list 'projectile-globally-ignored-file-suffixes "#")
  (setq projectile-mode-line '(:eval (format " Proj[%s]" (projectile-project-name)))))

;;; ido
;;;;;;;

(ido-mode t)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(use-package flx-ido :ensure t
  :init
  (flx-ido-mode 1))

(use-package ido-vertical-mode :ensure t
  :init
  (ido-vertical-mode 1))

;;; smex
;;;;;;;;
;; disabled in favour of ivy/counsel

(use-package smex :ensure t
  :disabled
  :init (smex-initialize)
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)
   ;;This is your old M-x.
   ("C-c C-c M-x" . execute-extended-command)))

;;; ivy/counsel (instead of helm/smex)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ivy :ensure t
  :demand
  :diminish (ivy-mode . "")
  :init
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
        ;; allow input not in order
        '((t   . ivy--regex-ignore-order))))

(use-package swiper :ensure t
  :bind (:map ivy-mode-map
              ("C-s" . swiper)))

(use-package counsel :ensure t
  :demand
  :bind (:map ivy-mode-map
              ("M-x" . counsel-M-x)
              ("<f1> u" . counsel-unicode-char))
  :config
  (setq counsel-find-file-ignore-regexp "\\(?:\\`[#.]\\)\\|\\(?:[#~]\\'\\)\\|\\(\\`\\.\\)"))

;;; avy (instead of ace-jump-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;; code formatting

(use-package format-all :ensure t)

;;; company
;;;;;;;;;;;

(defun company-mode/backend-with-yas (backend)
  (if (and (listp backend) (member 'company-yasnippet backend))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(use-package company :ensure t
  :diminish ""
  :init
  (global-company-mode)
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  (setq company-dabbrev-downcase nil)
  :config (setq company-idle-delay 0.3))

(use-package company-quickhelp :ensure t
  :config
  (company-quickhelp-mode t))

;; (use-package company-box :ensure t
;;   :hook (company-mode . company-box-mode))

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

;;; flyspell
;;;;;;;;;;;;

(use-package flyspell
  :commands (activate-flyspell flyspell-mode)

  :init
  (setq flyspell-issue-message-flag nil)
  (defun activate-flyspell ()
    (interactive)
    (ispell-change-dictionary "american")
    (flyspell-mode t)
    (flyspell-buffer)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; programming modes ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; general: language server protocol (lsp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lsp-mode :ensure t
  :pin melpa
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui :ensure t
  :pin melpa
  :hook
  (lsp-mode . lsp-ui-mode)
  (lsp-ui-mode . (lambda ()
                   (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
                   (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))))

(use-package company-lsp :ensure t
  :requires company
  :after lsp-mode
  :config
  (push 'company-lsp company-backends)
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil))

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

(use-package flycheck :ensure t
  :pin melpa
  :after elpy)

(use-package py-autopep8 :ensure t
  :after elpy
  :init (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package company-jedi :ensure t
  :after elpy)

(use-package elpy :ensure t
  :commands (elpy-enable)
  :config
  (add-hook 'elpy-mode-hook
            (lambda ()
              ;;(highlight-indentation-mode nil)
              (add-to-list 'company-backends 'company-jedi)))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules)))

;;; julia/ESS
;;;;;;;;;;;;;

;; (use-package ess :ensure t
;;   ;;:defer t
;;   :init
;;   (add-hook 'ess-julia-mode-hook
;;             (lambda () (define-key ess-julia-mode-map (kbd "<tab>")
;;                          'julia-latexsub-or-indent)))
;;   :mode ("\\.jl\\'" . ess-julia-mode)
;;   :config
;;   (require 'ess-site))

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
  (haskell-mode . interactive-haskell-mode)
  (haskell-mode . lsp)
  )

;; (use-package intero :ensure t
;;   :pin melpa
;;   :after haskell-mode
;;   :diminish ">>="
;;   :config (add-hook 'haskell-mode-hook 'intero-mode)
;;   )
(use-package nix-haskell-mode :ensure t
  :after haskell-mode)
(use-package lsp-haskell :ensure t)

;;; purescript
;;;;;;;;;;;;;;

(use-package purescript-mode :ensure t
  :defer t)
(use-package psc-ide :ensure t
  :defer t
  :after purescript-mode
  :diminish "<≡>"
  :init (add-hook 'purescript-mode-hook
                  (lambda ()
                    (psc-ide-mode)
                    (company-mode)
                    (flycheck-mode)
                    (turn-on-purescript-indentation))))

;;; rust
;;;;;;;;

(use-package rust-mode :ensure t
  :hook (rust-mode . lsp))

(use-package cargo :ensure t
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust :ensure t
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
  :mode "\\.js\\'")

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
  ;;(add-hook 'TeX-mode-hook 'my-auctex-startup)
  (setq TeX-parse-self t))

(use-package company-math :ensure t
  :after auctex)

(use-package company-auctex :ensure t
  :after auctex
  :config
  (add-hook 'TeX-mode-hook
            (lambda ()
              (setq-local company-backends
                          (append '(company-math-symbols-latex company-latex-commands)
                                  company-backends)))
            (company-auctex-init)))

(use-package reftex :ensure t
  :after auctex
  :config
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  (setq reftex-default-bibliography '("~/.emacs.d/zotero.bib")))

;;; org mode
;;;;;;;;;;;;

(use-package org :ensure t
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :config
  (progn
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
     '((lilypond t)
       (org t)))
    (setq org-confirm-babel-evaluate nil)
    (setq org-latex-pdf-process
          '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"))
    ))

(use-package ob-lilypond
  :after org)

;; (use-package ox-pandoc                  ; :ensure t
;;   :after org)

(use-package helm-bibtex :ensure t
  :pin melpa
  :defer t)

(use-package org-ref :ensure t
  :disabled
  :pin melpa
  :after org
  :init
  (setq
   org-ref-bibliography-notes "~/.emacs.d/zotero.org"
   org-ref-default-bibliography '("~/.emacs.d/zotero.bib")
   bibtex-completion-bibliography "~/.emacs.d/zotero.bib"
   bibtex-completion-pdf-field "file"
   )
  :config
  ;; use ivy
  ;;(org-ref-ivy-cite-completion)

  ;;; patches to org-ref and helm-bibtex for .dir-locals.el

  ;; defined in org-ref/org-ref-core.el
  ;; (setq org-ref-notes-function
  ;;       (lambda (thekey)
  ;;         (let* ((results (org-ref-get-bibtex-key-and-file thekey))
  ;;                (key (car results))
  ;;                (bibfile (cdr results))
  ;;                (notesfile org-ref-bibliography-notes))
  ;;           (save-excursion
  ;;             (with-temp-buffer
  ;;               (let ((org-ref-bibliography-notes notesfile))
  ;;                 (insert-file-contents bibfile)
  ;;                 (bibtex-set-dialect (parsebib-find-bibtex-dialect) t)
  ;;                 (bibtex-search-entry key)
  ;;                 (org-ref-open-bibtex-notes)))))))

  ;; ;; from helm-bibtex/bibtex-completion.el
  ;; (defun bibtex-completion-get-entry1 (entry-key &optional do-not-find-pdf)
  ;;   (let ((bcb bibtex-completion-bibliography))
  ;;     (with-temp-buffer
  ;;       (let ((bibtex-completion-bibliography bcb))
  ;;         (mapc #'insert-file-contents
  ;;               (bibtex-completion-normalize-bibliography 'bibtex)))
  ;;       (goto-char (point-min))
  ;;       (if (re-search-forward (concat "^[ \t]*@\\(" parsebib--bibtex-identifier
  ;;                                      "\\)[[:space:]]*[\(\{][[:space:]]*"
  ;;                                      (regexp-quote entry-key) "[[:space:]]*,")
  ;;                              nil t)
  ;;           (let ((entry-type (match-string 1)))
  ;;             (reverse (bibtex-completion-prepare-entry
  ;;                       (parsebib-read-entry entry-type) nil do-not-find-pdf)))
  ;;         (progn
  ;;           (display-warning :warning (concat "Bibtex-completion couldn't find entry with key \"" entry-key "\"."))
  ;;           nil)))))

  ;; ;; from helm-bibtex/helm-bibtex.el
  ;; (defun helm-bibtex (&optional arg)
  ;;   (interactive "P")
  ;;   (when arg
  ;;     (bibtex-completion-clear-cache))
  ;;   (helm :sources (list helm-source-bibtex helm-source-fallback-options)
  ;;         :full-frame helm-bibtex-full-frame
  ;;         :buffer "*helm bibtex*"
  ;;         :candidate-number-limit 500
  ;;         :bib bibtex-completion-bibliography))

  ;; ;; from helm-bibtex/bibtex-completion.el
  ;; (defun bibtex-completion-candidates ()
  ;;   (let ((bibtex-completion-bibliography (or helm-bib bibtex-completion-bibliography)))
  ;;     (let ((files (nreverse (bibtex-completion-normalize-bibliography 'bibtex)))
  ;;           reparsed-files)
  ;;       (message "bibtex-completion-candidates: bibfile: %s" bibtex-completion-bibliography)
  ;;       ;; Open each bibliography file in a temporary buffer,
  ;;       ;; check hash of bibliography and reparse if necessary:
  ;;       (cl-loop
  ;;        for file in files
  ;;        do
  ;;        (with-temp-buffer
  ;;          (insert-file-contents file)
  ;;          (let ((bibliography-hash (secure-hash 'sha256 (current-buffer))))
  ;;            (unless (string= (cadr (assoc file bibtex-completion-cache))
  ;;                             bibliography-hash)
  ;;              (bibtex-completion-clear-cache (list file))
  ;;              (message "Parsing bibliography file %s ..." file)
  ;;              (push (-cons* file
  ;;                            bibliography-hash
  ;;                            (bibtex-completion-parse-bibliography))
  ;;                    bibtex-completion-cache)
  ;;              ;; Mark file as reparsed.
  ;;              ;; This will be useful to resolve cross-references:
  ;;              (push file reparsed-files)))))
  ;;       ;; If some files were reparsed, resolve cross-references:
  ;;       (when reparsed-files
  ;;         (message "Resolving cross-references ...")
  ;;         (bibtex-completion-resolve-crossrefs files reparsed-files))
  ;;       ;; Finally return the list of candidates:
  ;;       (nreverse
  ;;        (cl-loop
  ;;         for file in files
  ;;         append (cddr (assoc file bibtex-completion-cache))))))))
  )

(use-package zotxt :ensure t
  :pin melpa
  :after org)

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

;;; writeroom-mode
;;;;;;;;;;;;;;;;;;

(use-package writeroom-mode :ensure t
  :commands (writeroom-mode global-writeroom-mode))

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
