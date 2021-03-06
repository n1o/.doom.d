;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Marek Barak"
      user-mail-address "mrk.barak@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq ns-alternate-modifier 'none)
(setq projectile-project-search-path '("~/projects/work/"))

(after! lsp-ui
  (setq lsp-ui-doc-enable t))

;;(after! org
;;  (map! :map org-mode-map
;;        :n "M-j" #'org-metadown
;;        :n "M-k" #'org-metaup)
;;  )
;;
(use-package org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                   :time-grid t
                                   :scheduled today)
                                  (:name "Due today"
                                   :deadline today)
                                  (:name "Important"
                                   :priority "A")
                                  (:name "Overdue"
                                   :deadline past)
                                  (:name "Due soon"
                                   :deadline future)
                                  (:name "Big Outcomes"
                                   :tag "bo")))
  :config
  (org-super-agenda-mode)
)

(require 'org)
(setq org-clock-sound "~/sounds/klaxon.wav")

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq org-roam-capture-templates
  '(("d" "default" plain "%?"
     :if-new (file+head "%<%y%m%d%h%m%s>-${slug}.org"
                        "#+title: ${title}\n#+startup: latexpreview\n#+startup: inlineimages")
     :unnarrowed t)))


(setq org-roam-directory "~/my-org-roam-notes")
(setq! org-noter-notes-search-path '("~/my-org-roam-notes/"))
;; (setq! bibtex-completion-bibliography '("~/my-org-roam-notes/reference/references.bib"))
(setq! citar-bibliography '("~/my-org-roam-notes/reference/references.bib"))
(setq org-attach-id-dir "~/my-org-roam-notes/attachments/")
(setq org-journal-dir "~/my-journal")

;;(setq! bibtex-completion-library-path '("~/my-org-roam-notes/papers/")
;;       bibtex-completion-notes-path "~/my-org-roam-notes/")

(setq! citar-library-paths '("~/my-org-roam-notes/papers/")
       citar-notes-paths '("~/my-org-roam-notes/"))

(setq org-tag-alist '(("causality" . ?c) ("compilers" . ?i)))

(use-package lsp-python-ms
	     :ensure t 
	     :hook (python-mode . (lambda ()
				    (require 'lsp-python-ms)
				    (lsp)))
	     :init
	     (setq lsp-python-ms-executable (executable-find "pylsp")))


;;(use-package! org-roam-bibtex
;;  :after org-roam
;;  :config
;;  ) ;

(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org.gpg"
                            "#+title: %<%Y-%m-%d>\n"))))
(setq org-agenda-files '("~/Dropbox/org"))
