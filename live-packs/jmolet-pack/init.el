;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(setq tab-width 2)
(setq indent-level 2)

;; clojure stuff
;; Load bindings config
(live-load-config-file "bindings.el")
(require 'color-theme)
(require 'cider)
(require 'rainbow-delimiters)
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
(defcljface clojure-java-call    "#7587a6"   "Clojure Java calls")
(defcljface clojure-keyword      "#45b8f2"   "Clojure keywords")
(defcljface clojure-special      "#0074e8"   "Clojure special")
(defcljface clojure-double-quote "#00920A"   "Clojure special")

;; More syntax coloring
(defun tweak-clojure-syntax (mode)
  (mapcar (lambda (x) (font-lock-add-keywords mode x))
          '(((":\\w+" . 'clojure-keyword))
            (("#?\"" 0 'clojure-double-quote prepend))
            (("nil\\|true\\|false\\|%[1-9]?" . 'clojure-special))
            (("(\\(\\.[^ \n)]*\\|[^ \n)]+\\.\\|new\\)\\([ )\n]\\|$\\)" 1
              'clojure-java-call))
            (("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 'font-lock-warning-face t))
            (("(\\(->\\>\\)" 0 (progn (compose-region (match-beginning 1)
                                                      (match-end 1) "→") nil)))
            (("(\\(->>\\>\\)" 0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "↠") nil)))
            (("(\\(complement\\>\\)" 0 (progn (compose-region
                                               (match-beginning 1)
                                               (match-end 1) "¬") nil)))
            (("^[a-zA-Z0-9-.*+!_?]+?>" . 'cider-repl-prompt-face)))))

(eval-after-load 'cider-repl-mode
  '(progn
     (font-lock-mode nil)
     (tweak-clojure-syntax 'cider-repl-mode)
     (font-lock-mode t)))

(eval-after-load 'clojure-mode
  '(progn
     (tweak-clojure-syntax 'clojure-mode)))

(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook
          (lambda ()
            (font-lock-mode nil)
            (clojure-font-lock-setup)
            (font-lock-mode t)))

(tweak-clojure-syntax 'cider-repl-mode)

;;python stuff from http://caisah.info/emacs-for-python/
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)
;(add-hook 'after-init-hook #'global-flycheck-mode)
;(require 'autopair)
;(add-hook 'python-mode-hook 'autopair-mode)
;;(autopair-global-mode) ;; to enable in all buffers
(add-hook 'python-mode-hook 'linum-mode)

;; rust stuff
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "/home/jmolet/Projects/rust/src") ;; Rust source code PATH
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
