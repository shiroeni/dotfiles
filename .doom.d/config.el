;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Eugene Palchikov"
      user-mail-address "me@aryon.dev"

      doom-font (font-spec :family "Fantasque Sans Mono" :size 18)

      doom-theme 'doom-gruvbox
      doom-themes-treemacs-theme 'doom-treemacs-colors

      projectile-project-search-path "~/Code"

      ;; мимикрируем под нормальных людей
      elcord--editor-name "Emacs"

      elcord--editor-icon "emacs_icon"
      elcord-use-major-mode-as-main-icon t
      )

(require 'ace-window)

;; make treemacs selectable from ace-window
(after! treemacs
  (setq aw-ignored-buffers (delq 'treemacs-mode aw-ignored-buffers)))

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
