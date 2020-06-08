;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     docker
     sql
     yaml
     html
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory "~/.yas-snippets")
     better-defaults
     emacs-lisp
     git
     markdown
     org
     syntax-checking
     version-control
     (ruby :variables
           ruby-test-runner 'rspec
           ruby-version-manager 'rbenv)
     ruby-on-rails
     javascript
     typescript
     clojure
     elixir
     docker
     ; (wakatime
     ;  :variables
     ;  wakatime-api-key "xxx"
     ;  wakatime-cli-path "/usr/local/bin/wakatime")
     )

   dotspacemacs-additional-packages '(dash autothemer elcord yard-mode)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 15))
   dotspacemacs-themes '(gruvbox-dark-hard
                         gruvbox-light-soft)
   dotspacemacs-default-font '("Cascadia Code"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-maximized-at-startup t
   dotspacemacs-line-numbers t
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; for gruvbox themes
  (mapc 'load (file-expand-wildcards "~/.emacs.d/elpa/dash-*/dash.el"))
  (mapc 'load (file-expand-wildcards "~/.emacs.d/elpa/autothemer-*/autothemer.el"))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Disable magic comments with encoding
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Enable highlighting of YARDoc in ruby-mode
  (add-hook 'ruby-mode-hook 'yard-mode)
  (add-hook 'ruby-mode-hook 'eldoc-mode)

  (setq coffee-tab-width 2) ; coffeescript
  (setq javascript-indent-level 2) ; javascript-mode
  (setq js-indent-level 2) ; js-mode
  (setq js2-basic-offset 2) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2) ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2) ; web-mode, js code in html file
  (setq css-indent-offset 2) ; css-mode

  ;; (elcord-mode)
  ;; (global-wakatime-mode)
  )

;; Custom function
(defun remove-enh-magic-comment ()
  (remove-hook 'before-save-hook 'enh-ruby-mode-set-encoding t))

(defun yml-sorter ()
  "Invoke `yml-sorter` utility on current buffer"
  (interactive)
  (shell-command (concat "yml-sorter --input " buffer-file-name)))
