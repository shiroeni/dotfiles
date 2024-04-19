;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Eugene Palchikov"
      user-mail-address "me@aryon.dev"

      doom-font (font-spec :family "Fantasque Sans Mono" :size 16)
      doom-theme 'doom-monokai-classic

      org-directory "~/org/"

      display-line-numbers-type 'relative

      projectile-project-search-path '("~/Code")

      rspec-use-docker-when-possible t
      rspec-docker-command "docker compose run"
      rspec-docker-container "runner"

      elcord--editor-name "Emacs"
      elcord--editor-icon "emacs_pen_icon"
      elcord-use-major-mode-as-main-icon t

      blamer-commit-formatter "- %s"
      blamer-max-commit-message-length 40

      lsp-ui-doc-show-with-cursor t
      lsp-ui-doc-show-with-mouse t)

(setq +ligatures-in-modes nil)

(defun risky-local-variable-p (sym &optional _ignored) nil)

(map! :leader
      :desc "Go to definition (robe-jump)"
      "m g g" #'robe-jump)

(map! :leader
      :desc "Go to definition (LSP)"
      "m g f" #'lsp-find-definition)

(map! :leader
      :desc "Find references"
      "m g r" #'lsp-find-references)

;; fix company "do -> downcase" in ruby-mode
(setq company-minimum-prefix-length 3)
;; complete with <tab>
;(with-eval-after-load 'company
;  (define-key company-mode-map (kbd "<tab>") 'company-complete))

;; fancy blame line like in code lens in vscode
(use-package blamer
  :bind (("s-i" . blamer-show-commit-info))
  :defer 20
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 20)
  :custom-face
  (blamer-face ((t :foreground "#928374"
                   :background nil
                   :height 140
                   :italic t)))
  :config
  (global-blamer-mode 1))

(require 'mmm-auto)
(setq mmm-global-mode 'maybe)

;; custom functions...
(defun yml-sorter ()
  "Run \"yml-sorter\" on file from current buffer"
  (interactive)
  (shell-command (concat "yml-sorter --input " buffer-file-name))
  )

;; fix cyrillic fonts
(after! unicode-fonts
    (let ((doom-font-name (plist-get
                         (font-face-attributes doom-font) :family)))

    (dolist (unicode-fonts-fallback-font
             (list doom-font-name))
      (add-to-list 'unicode-fonts-fallback-font-list unicode-fonts-fallback-font))

    (dolist (unicode-block '("Cyrillic"
                             "Cyrillic Extended-A"
                             "Cyrillic Extended-B"
                             "Cyrillic Supplement"))
      (push doom-font-name (cadr (assoc unicode-block unicode-fonts-block-font-mapping))))

    ))

(elcord-mode)
