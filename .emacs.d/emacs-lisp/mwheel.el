;;; No copyright
;; Maintainer: Jan Eggert Kofoed  mailto:jan.kofoed@person.dk
;; Keywords: intellimouse
;; This file can be used with GNU Emacs.
;; The code was taken from
;;   www.inria.fr/koala/colas/mouse-wheel-scroll
;; which is maintained by Colas Nahaboo, but the code is put there
;; with courtesy of
;;    Sylvia Knight, Sylvia.Knight@cl.cam.ac.uk
;;; Code:
;;
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)