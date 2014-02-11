;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")
(require 'nrepl)
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;(color-theme-cyberpunk)
     (color-theme-darkmate)))

;; Macro for face definition
(defmacro defcljface (name color desc &optional others)
  `(defface ,name '((((class color)) (:foreground ,color ,@others)))
     ,desc :group 'faces))

;; Define extra clojure faces
(defcljface clojure-keyword      "#45b8f2"   "Clojure keywords")
(defcljface clojure-special      "#0074e8"   "Clojure special")
(defcljface clojure-double-quote "#00920A"   "Clojure special")

;; More syntax coloring
(defun tweak-clojure-syntax (mode)
  (mapcar (lambda (x) (font-lock-add-keywords mode x))
          '(((":\\w+" . 'clojure-keyword))
            (("#?\"" 0 'clojure-double-quote prepend))
            (("nil\\|true\\|false\\|%[1-9]?" . 'clojure-special))
            (("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 'font-lock-warning-face t))
            (("(\\(->\\>\\)" 0 (progn (compose-region (match-beginning 1)
                                                      (match-end 1) "→") nil)))
            (("(\\(->>\\>\\)" 0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "↠") nil)))
            (("(\\(complement\\>\\)" 0 (progn (compose-region
                                               (match-beginning 1)
                                               (match-end 1) "¬") nil)))
            (("^[a-zA-Z0-9-.*+!_?]+?>" . 'nrepl-prompt-face)))))

(eval-after-load "nrepl"
  '(progn
     (tweak-clojure-syntax 'nrepl-mode)))

(eval-after-load "clojure-mode"
  '(progn
     (tweak-clojure-syntax 'clojure-mode)))

(require 'rainbow-delimiters)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-hook 'nrepl-mode-hook
          (lambda ()
            (font-lock-mode nil)
            (clojure-mode-font-lock-setup)
            (font-lock-mode t)))

(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
;(defun my-nrepl-mode-setup ()
;  (require 'nrepl-ritz))

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages '(clojure-mode
                      nrepl
                      ;nrepl-ritz
                      ;cider
                      ))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;(defadvice message (after message-tail activate)
;  "goto point max after a message in nrepl-server"
;  (with-current-buffer "*nrepl-server*"
;    (goto-char (point-max))
;    (let ((windows (get-buffer-window-list (current-buffer) nil t)))
;      (mapc (lambda (w) (set-window-point w (point-max))) windows))))

;(require 'sr-speedbar)
;(require 'speedbar)
;(speedbar-add-supported-extension ".clj")
;(setq ecb-use-speedbar-instead-native-tree-buffer 'dir)
;(setq speedbar-show-unknown-files t)
;(setq speedbar-tag-regroup-maximum-length 100)
;(setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1)
;(setq ecb-speedbar-buffer-sync nil)
;(setq speedbar-tag-hierarchy-method '(speedbar-sort-tag-hierarchy))
;(setq ecb-auto-expand-directory-tree)
;


;; python

;(add-to-list 'load-path "/home/jmolet/Projects/emacs-for-python/epy-init.el")
;(require 'epy-setup)
;(require 'epy-python)
;(require 'epy-completion)
;(require 'epy-editing)
;(require 'epy-bindings)
;(require 'epy-nose)
