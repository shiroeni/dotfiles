;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Eugene Palchikov"
      user-mail-address "me@aryon.dev")

(setq doom-font (font-spec :family "Fantasque Sans Mono" :size 16)
      doom-unicode-font (font-spec :family "Fantasque Sans Mono" :size 16)
      ;; wakatime-cli-path "/usr/local/bin/wakatime"
      doom-theme 'doom-gruvbox
      doom-themes-treemacs-theme 'doom-colors
      org-directory "~/Org"
      projectile-project-search-path "~/Code"

      ;; мимикрируем под нормальных людей
      elcord--editor-name "Emacs"

      elcord--editor-icon "emacs_icon"
      elcord-use-major-mode-as-main-icon t

      flycheck-disabled-checkers '(ruby-reek)
      )

;; (elcord-mode)
