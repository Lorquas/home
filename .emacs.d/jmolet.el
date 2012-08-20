(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
(global-hl-line-mode 1)
(set-face-background 'hl-line "#151500")

(require 'clojure-mode)
(require 'custom-clojure)

(require 'color-theme)
(eval-after-load "color-theme"
                 '(progn
                    (color-theme-initialize)
                    (color-theme-darkmate)))

;; More syntax coloring
(defun tweak-clojure-syntax (mode)
  (mapcar (lambda (x) (font-lock-add-keywords mode x))
          '((("#?['`]*(\\|)" . 'clojure-parens))
            (("#?\\^?{\\|}" . 'clojure-braces))
            (("\\[\\|\\]" . 'clojure-brackets))
            ((":\\w+" . 'clojure-keyword))
            (("#?\"" 0 'clojure-double-quote prepend))
            (("nil\\|true\\|false\\|%[1-9]?" . 'clojure-special))
            (("(\\(\\.[^ \n)]*\\|[^ \n)]+\\.\\|new\\)\\([ )\n]\\|$\\)" 1
              'clojure-java-call))
            (("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 'font-lock-warning-face t))
            (("(\\(fn\\>\\)" 0 (progn (compose-region (match-beginning 1)
                                                      (match-end 1) "ƒ") nil)))
            (("(\\(->\\>\\)" 0 (progn (compose-region (match-beginning 1)
                                                      (match-end 1) "→") nil)))
            (("(\\(->>\\>\\)" 0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "↠") nil)))
            (("(\\(complement\\>\\)" 0 (progn (compose-region
                                               (match-beginning 1)
                                               (match-end 1) "¬") nil)))
            (("^[a-zA-Z0-9-.*+!_?]+?>" . 'slime-repl-prompt-face)))))

(add-hook 'slime-repl-mode-hook 
	(progn  (lambda()(paredit-mode 1))))

(add-hook 'eshell-mode-hook 
	(progn  (lambda()(paredit-mode 1))))

(add-hook 'clojure-mode-hook 
	(progn  (lambda()(paredit-mode 1))))

(add-hook 'clojure-mode-hook 
          (lambda () 
            (define-key clojure-mode-map (kbd "M-[") 'paredit-wrap-square)
            (define-key clojure-mode-map "{" 'paredit-open-curly)
            (define-key clojure-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)))

(autoload 'paredit-wrap-square "paredit")
(add-hook 'slime-connected-hook
          (lambda () 
            (define-key slime-mode-map " " 'slime-space)
            (define-key slime-mode-map (kbd "M-[") 'paredit-wrap-square)
            (define-key slime-repl-mode-map [C-S-up] 'slime-repl-previous-matching-input)
            (define-key slime-repl-mode-map "{" 'paredit-open-curly)))

(defun goto-last-edit-point ()
  "Go to the last point where editing occurred."
  (interactive)
  (let ((undos buffer-undo-list))
    (when (listp undos)
      (while (and undos
		  (let ((pos (or (cdr-safe (car undos))
				 (car undos))))
		    (not (and (integerp pos)
			      (goto-char (abs pos))))))
	(setq undos (cdr undos))))))
(global-set-key (kbd "C-c SPC") 'goto-last-edit-point)

(global-set-key [f5]
  '(lambda () "Refresh the buffer from the disk (prompt of modified)."
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t)))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


