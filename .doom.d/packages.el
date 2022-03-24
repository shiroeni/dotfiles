;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! elcord)

(package! docker-robe
  :recipe (:host github :repo "aki2o/emacs-docker-robe" ))

(package! blamer
  :recipe (:host github :repo "artawower/blamer.el"))

(package! plz
  :recipe (:host github :repo "alphapapa/plz.el"))

(package! ement
  :recipe (:host github :repo "alphapapa/ement.el"))
