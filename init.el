(setq ad-redefinition-action 'accept)

;;;;;;;;;;;;;;;;;;
;;;; packages ;;;;
;;;;;;;;;;;;;;;;;;

(require 'package)

(add-to-list 'package-archives 
    '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives 
    '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives 
    '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; for elpy
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(package-install 'use-package)

;;; currently installed:
;;;;;;;;;;;;;;;;;;;;;;;;

;; find with (remove-duplicates package-activated-list)
;; M-x eval-print-last-sexp

(setq my-packages
      '(ac-geiser ac-slime ace-jump-mode auto-complete chicken-scheme cider clojure-mode company-auctex auctex company-math company-quickhelp elpy company find-file-in-project geiser gnuplot graphviz-dot-mode haskell-mode highlight-indentation ido-ubiquitous ido-completing-read+ ido-vertical-mode idomenu js2-mode markdown-mode math-symbol-lists monokai-theme no-easy-keys nodejs-repl org paredit popup pos-tip projectile pkg-info epl prolog pyvenv queue s slime smart-mode-line rich-minority smex solarized-theme dash spinner undo-tree yaml-mode yasnippet zenburn-theme))

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
   [unspecified "#110F13" "#b13120" "#719f34" "#ceae3e" "#7c9fc9" "#7868b5" "#009090" "#F4EAD5"] t)
 '(background-color "#fdf6e3")
 '(background-mode light)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#657b83")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" default)))
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#383838")
 '(foreground-color "#657b83")
 '(fringe-mode nil nil (fringe))
 '(geiser-mode-auto-p nil)
 '(geiser-mode-autodoc-p nil)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)) t)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#1e1e1e")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(org-agenda-files (quote ("~/Uni/master/notes.org")))
 '(package-selected-packages
   (quote
    (ace-window avy ivy-bibtex counsel swiper ox-pandoc org-ref web-mode php-mode use-package ensime intero smart-mode-line-powerline-theme zenburn-theme yaml-mode writeroom-mode undo-tree solarized-theme smex smart-mode-line slime-company s py-autopep8 prolog projectile paredit org nodejs-repl no-easy-keys monokai-theme material-theme markdown-mode magit julia-shell js2-mode idomenu ido-vertical-mode ido-ubiquitous haskell-mode graphviz-dot-mode gnuplot flycheck flx-ido ess elpy ein cyberpunk-theme csv-mode company-quickhelp company-math company-jedi company-auctex cider chicken-scheme aggressive-indent ace-jump-mode ac-slime ac-geiser)))
 '(powerline-color1 "#1e1e1e")
 '(powerline-color2 "#111111")
 '(safe-local-variable-values
   (quote
    ((org-ref-pdf-directory . "~/Uni/master/papers/")
     (bibtex-completion-notes-path . "~/Uni/master/notes/bibliography.org")
     (bibtex-completion-bibliography . "~/Uni/master/notes/bibliography.org")
     (org-ref-bibliography-notes . "~/Uni/master/notes/bibliography.org")
     (org-ref-default-bibliography "~/Uni/master/notes/bibliography.bib")
     (reftex-default-bibliography "~/Uni/master/notes/bibliography.bib")
     (bibtex-completion-library-path . "~/Uni/master/papers")
     (org-ref-pdf-directory "~/Uni/master/papers/")
     (eval yas-activate-extra-mode
           (quote overtone-mode))
     (eval visual-line-mode t))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
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
 '(writeroom-width 100))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal))))
 '(header-line ((t (:foreground "#F0DFAF" :box nil))))
 '(mode-line ((t (:background "#2B2B2B" :foreground "#8FB28F" :inverse-video nil :box nil))))
 '(mode-line-inactive ((t (:background "#383838" :foreground "#5F7F5F" :inverse-video nil :box nil)))))
(put 'scroll-left 'disabled nil)

;; alternative modeline faces with border
;;'(mode-line ((t (:background "#2B2B2B" :foreground "#8FB28F" :inverse-video nil :box (:line-width 1 :color "#75715E")))))
;;'(mode-line-inactive ((t (:background "#383838" :foreground "#5F7F5F" :inverse-video nil :box (:line-width 1 :color "#75715E")))))


;;;;;;;;;;;;;;;;;;;;;;;
;;;; customization ;;;;
;;;;;;;;;;;;;;;;;;;;;;;

;;; smart-mode-line
;;;;;;;;;;;;;;;;;;;

;; These two lines are just examples
;;(setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.

(use-package smart-mode-line :ensure t
  :init
  ;;(setq powerline-default-separator 'wave)
  (setq sml/theme 'respectful)
  (sml/setup))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; general editing settings and tools ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;use tabs
(setq-default indent-tabs-mode nil)

;;; delete-selection-mode
(delete-selection-mode 1)

;;; undo-tree
(use-package undo-tree :ensure t
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

;;; ace-jump
(use-package ace-jump-mode :ensure t
  :disabled ;; in favour of avy
  :bind (("C-;" . ace-jump-mode)))

;;; projectile
(use-package projectile :ensure t
  :init
  (projectile-global-mode)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ivy :ensure t
  :demand
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
        ;;("C-'" . ivy-avy)
        )
  :init
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  ;;(setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  ;;(setq ivy-height 10)
  ;; does not count candidates
  ;;(setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
        ;; allow input not in order
        '((t   . ivy--regex-ignore-order)))
  )

(use-package swiper :ensure t
  :demand
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
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  
  :config
  ;;(yas-global-mode 1)
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

;;; autocomplete
;;;;;;;;;;;;;;;;

(use-package auto-complete :ensure t
  :disabled
  )

;;; company

(defun company-mode/backend-with-yas (backend)
  (if (and (listp backend) (member 'company-yasnippet backend))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(use-package company :ensure t
  :init
  (global-company-mode)
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))

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
  :commands (my-enable-paredit-mode)
  
  :init
  (add-hook 'emacs-lisp-mode-hook       #'paredit-mode)
  ;;(add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook             #'paredit-mode)
  (add-hook 'lisp-mode-hook             #'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'scheme-mode-hook           #'paredit-mode)
  (add-hook 'extempore-mode-hook        #'paredit-mode)
  
  :config
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
  (paredit-annotate-functions-with-examples))

;;; flyspell

(use-package flyspell
  :commands (activate-flyspell flyspell-mode)
  
  :init
  (setq flyspell-issue-message-flag nil)
  (defun activate-flyspell ()
    (interactive)
    (ispell-change-dictionary "american")
    (flyspell-mode t)
    (flyspell-buffer)))

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

;(load (expand-file-name "~/lisp/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy slime-quicklisp slime-company))

;;; ac-slime
;;;;;;;;;;;;

;; (defun my-set-up-slime-ac ()
;;   (auto-complete-mode t)
;;   (set-up-slime-ac t) ; enable fuzzy completion (t)
;;   ;;(set-up-slime-ac) ; no fuzzy completion
;;   (delete 'ac-source-words-in-same-mode-buffers ac-sources))

;; ;;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;; ;;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-mode-hook 'my-set-up-slime-ac)
;; (add-hook 'slime-repl-mode-hook 'my-set-up-slime-ac)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'slime-repl-mode))

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
;;(setq cider-repl-use-pretty-printing t)

(defun cider-mode-stuff ()
  (company-mode t)
  (my-enable-paredit-mode)
  (eldoc-mode t))

(setq cider-lein-command "~/.bin/lein")
(add-hook 'cider-repl-mode-hook #'cider-mode-stuff)
(add-hook 'cider-mode-hook #'cider-mode-stuff)
;;(add-hook 'clojure-mode-hook #'my-enable-paredit-mode)
(add-hook 'cider-mode-hook
          #'(lambda ()
              (define-key cider-mode-map "M-TAB" nil)))

;;;;;;;;;;;;;;
;;;; node ;;;;
;;;;;;;;;;;;;;

;;(require 'nodejs-repl)

;;;;;;;;;;;;;;;;
;;;; python ;;;;
;;;;;;;;;;;;;;;;

(elpy-enable)
;;(elpy-use-ipython)

(add-hook 'elpy-mode-hook
          (lambda ()
            (define-key yas-minor-mode-map (kbd "<tab>") 'yas-expand)
            (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
            (highlight-indentation-mode nil)
            (add-to-list 'company-backends 'company-jedi)))

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;;;;;;;;;;;;;;;;;;
;;;; julia/ESS ;;;;
;;;;;;;;;;;;;;;;;;;

(require 'ess-site)

;;;;;;;;;;;;;;;;;
;;;; haskell ;;;;
;;;;;;;;;;;;;;;;;

(add-hook 'haskell-mode-hook 'intero-mode)

;;;;;;;;;;;;;;;
;;;; scala ;;;;
;;;;;;;;;;;;;;;

(use-package ensime
  :ensure t
  :pin melpa-stable)

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
(setq TeX-parse-self t)

;;; ref-tex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-default-bibliography '("~/.emacs.d/zotero.bib"))

;;;;;;;;;;;;;
;;;; org ;;;;
;;;;;;;;;;;;;

(use-package org :ensure t
  :config
  (unless (boundp 'org-latex-classes)
    (setq org-latex-classes nil))

  (add-to-list 'org-latex-classes
               ;; list of notes
               '("notes"
                 "\\documentclass[a4paper,10pt,DIV=12]{scrartcl}\n
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      %\\usepackage{libertine}\n
      %\\renewcommand*\\oldstylenums[1]{{\\fontfamily{fxlj}\\selectfont #1}}\n
      %\\usepackage{lmodern}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}"

                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;;; org-ref

(use-package org-ref :ensure t
  :after org
  :init
  (setq
   ;;org-ref-bibliography-notes "~/.emacs.d/zotero.org"
   ;;org-ref-default-bibliography '("~/.emacs.d/zotero.bib")
   ;;bibtex-completion-bibliography "~/Uni/master/notes/bibliography.org"
   )
  :config
  ;; use ivy
  ;;(org-ref-ivy-cite-completion)
  
  ;;; patches to org-ref and helm-bibtex for .dir-locals.el
  
  ;; defined in org-ref/org-ref-core.el
  (setq org-ref-notes-function
        (lambda (thekey)
          (let* ((results (org-ref-get-bibtex-key-and-file thekey))
                 (key (car results))
                 (bibfile (cdr results))
                 (notesfile org-ref-bibliography-notes))
            (save-excursion
              (with-temp-buffer
                (let ((org-ref-bibliography-notes notesfile))
                  (insert-file-contents bibfile)
                  (bibtex-set-dialect (parsebib-find-bibtex-dialect) t)
                  (bibtex-search-entry key)
                  (org-ref-open-bibtex-notes)))))))
  
  ;; from helm-bibtex/bibtex-completion.el
  (defun bibtex-completion-get-entry1 (entry-key &optional do-not-find-pdf)
    (let ((bcb bibtex-completion-bibliography))
      (with-temp-buffer
        (let ((bibtex-completion-bibliography bcb))
          (mapc #'insert-file-contents
                (bibtex-completion-normalize-bibliography 'bibtex)))
        (goto-char (point-min))
        (if (re-search-forward (concat "^[ \t]*@\\(" parsebib--bibtex-identifier
                                       "\\)[[:space:]]*[\(\{][[:space:]]*"
                                       (regexp-quote entry-key) "[[:space:]]*,")
                               nil t)
            (let ((entry-type (match-string 1)))
              (reverse (bibtex-completion-prepare-entry
                        (parsebib-read-entry entry-type) nil do-not-find-pdf)))
          (progn
            (display-warning :warning (concat "Bibtex-completion couldn't find entry with key \"" entry-key "\"."))
            nil)))))
  
  ;; from helm-bibtex/helm-bibtex.el
  (defun helm-bibtex (&optional arg)
    (interactive "P")
    (when arg
      (bibtex-completion-clear-cache))
    (helm :sources (list helm-source-bibtex helm-source-fallback-options)
          :full-frame helm-bibtex-full-frame
          :buffer "*helm bibtex*"
          :candidate-number-limit 500
          :bib bibtex-completion-bibliography))
  
  ;; from helm-bibtex/bibtex-completion.el
  (defun bibtex-completion-candidates ()
    (let ((bibtex-completion-bibliography (or helm-bib bibtex-completion-bibliography)))
      (let ((files (nreverse (bibtex-completion-normalize-bibliography 'bibtex)))
            reparsed-files)
        (message "bibtex-completion-candidates: bibfile: %s" bibtex-completion-bibliography)
        ;; Open each bibliography file in a temporary buffer,
        ;; check hash of bibliography and reparse if necessary:
        (cl-loop
         for file in files
         do
         (with-temp-buffer
           (insert-file-contents file)
           (let ((bibliography-hash (secure-hash 'sha256 (current-buffer))))
             (unless (string= (cadr (assoc file bibtex-completion-cache))
                              bibliography-hash)
               (bibtex-completion-clear-cache (list file))
               (message "Parsing bibliography file %s ..." file)
               (push (-cons* file
                             bibliography-hash
                             (bibtex-completion-parse-bibliography))
                     bibtex-completion-cache)
               ;; Mark file as reparsed.
               ;; This will be useful to resolve cross-references:
               (push file reparsed-files)))))
        ;; If some files were reparsed, resolve cross-references:
        (when reparsed-files
          (message "Resolving cross-references ...")
          (bibtex-completion-resolve-crossrefs files reparsed-files))
        ;; Finally return the list of candidates:
        (nreverse
         (cl-loop
          for file in files
          append (cddr (assoc file bibtex-completion-cache))))))))

;;;;;;;;;;;;;;;;;;;;
;;;; cheatsheet ;;;;
;;;;;;;;;;;;;;;;;;;;

(defun cheatsheet ()
  (interactive)
  (find-file-other-window "~/.emacs.d/cheatsheet"))
(put 'downcase-region 'disabled nil)
