; http://www.rattlesnake.com/intro/Loading-Files.html
(setq load-path (cons "~/.emacs.d/load-path" load-path))
; lua
; http://lua-mode.luaforge.net/
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(add-hook 'org-mode-hook 'auto-fill-mode)

; If you want colorization, turn on global-font-lock or add this:
(add-hook 'lua-mode-hook 'turn-on-font-lock)
; remove space before ('s; http://stackoverflow.com/questions/913449/changing-paredit-formatting
(add-hook 'lua-mode-hook (lambda () 
	(defun paredit-space-for-delimiter-p (endp delimiter)
  (and (not (if endp (eobp) (bobp)))
       (memq (char-syntax (if endp (char-after) (char-before)))
             (list ?\"  ;; REMOVED ?w ?_
                   (let ((matching (matching-paren delimiter)))
                     (and matching (char-syntax matching)))))))))

; don't scatter backup files everywhere please
(setq backup-directory-alist `(("." . "~/.emacs.d/autosave")))

; dark colors
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-dark-laptop)

; no toolbar, http://www.emacswiki.org/emacs/ToolBar
(tool-bar-mode -1)

; http://stackoverflow.com/questions/2081577/setting-emacs-split-to-horizontal
(setq split-height-threshold nil)
(setq split-width-threshold 120)

; orgmode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; visible whitespace: http://www.emacswiki.org/emacs/WhiteSpace
(require 'whitespace)
;(whitespace-mode)
;(add-hook 'clojure-mode-hook 'whitespace-mode)
;(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization."        t)

; http://geosoft.no/development/emacs.html
;(set-face-background 'region "yellow") ; Set region background color

; http://emacsblog.org/2007/09/30/quick-tip-spaces-instead-of-tabs/
; I hate tabs!
(setq-default indent-tabs-mode nil)

; enable clojure-test-mode, from clojure-test-mode source
(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(add-hook 'clojure-mode-hook
	  (lambda () (save-excursion
		  (goto-char (point-min))
		  (if (or (search-forward "(deftest" nil t)
			  (search-forward "(with-test" nil t)
		      (clojure-test-mode))))))

; http://groups.google.com/group/clojure/browse_thread/thread/9da037d81ba30ff4
; slime-eval output goes to repl, even if it's from another thread
(add-hook 'slime-connected-hook 'slime-redirect-inferior-output)
(custom-set-variables
	'(swank-clojure-extra-vm-args '("-server" "-Dcom.sun.management.jmxremote=true")))

; http://en.wikibooks.org/wiki/Clojure_Programming/Getting_Started#Emacs_tab_completion
; tab completion for clojure
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))

(defun my-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))

;; add hooks for modes you want to use the tab completion for:
(add-hook 'c-mode-hook          'my-tab-fix)
(add-hook 'sh-mode-hook         'my-tab-fix)
(add-hook 'emacs-lisp-mode-hook 'my-tab-fix)
(add-hook 'clojure-mode-hook    'my-tab-fix)
(add-hook 'lua-mode-hook        'my-tab-fix)

; enable paredit for clojure; clojure-mode.el
(defun lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'emacs-lisp-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'lua-mode-hook 'lisp-enable-paredit-hook)

; paste from the system clipboard
; http://www.emacswiki.org/emacs-en/CopyAndPaste
(setq x-select-enable-clipboard t)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "bitstream" :family "Bitstream Vera Sans Mono")))))
