;;; elpa:
;archives
;auto-complete-20140515.1959
;color-theme-sanityinc-solarized-20140502.559
;company-20151103.230
;company-ghc-20151008.508
;flymake-easy-20130907.131
;flymake-haskell-multi-20130620.422
;ghc-20140513.1445
;ghci-completion-20140316.2331
;gnupg
;haskell-mode-20140515.850
;hi2-20141005.1231
;jabber-20140512.1344
;multiple-cursors-20140418.815
;popup-20140207.1702
;undo-tree-20140509.522
;w3m-20140420.2007
;web-mode-20140528.1125
;whole-line-or-region-20110901.130

(add-to-list 'load-path (expand-file-name "~/.emacs.d") t)
;; extend load path
;(let ((default-directory user-emacs-directory))
;  (normal-top-level-add-to-load-path '(".")))
;; packages
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
			 ;("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
;;-------------------------------------------------------------------------------
;; appearance
;;-------------------------------------------------------------------------------
(set-default-font "DejaVu Sans Mono-10")
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;-------------------------------------------------------------------------------
;; autocomplete
;;-------------------------------------------------------------------------------
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(define-key ac-completing-map "\C-n" 'ac-next)
(define-key ac-completing-map "\C-p" 'ac-previous)
(global-set-key (kbd "M-/") 'hippie-expand)
;;-------------------------------------------------------------------------------
;; editing
;;-------------------------------------------------------------------------------
;; undo
(require 'undo-tree)
(global-undo-tree-mode)
;; multiple cursor
(require 'multiple-cursors)
(multiple-cursors-mode)
(global-hl-line-mode 1)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
;; better commenting
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))
;; linum
(global-linum-mode 1)
(setq linum-format " %2d")
;; tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq standard-indent 4)
;; misc
(show-paren-mode 1)
(column-number-mode 1)
					;(add-hook 'before-save-hook 'delete-trailing-whitespace)
(whole-line-or-region-mode)
(setq kill-whole-line t)
(blink-cursor-mode 0)
(setq-default indicate-empty-lines t)
(require 'saveplace)
(setq-default save-place t)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      save-place-file (concat user-emacs-directory "places")
      backup-by-copying t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      auto-save-file-name-transforms `((".*" , temporary-file-directory t))
      )
;;-------------------------------------------------------------------------------
;; keys
;;-------------------------------------------------------------------------------
(global-set-key "\C-z" 'repeat)
(global-unset-key "\C-x\C-z")
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
;; search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
;; buffers
(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)
(global-set-key [f2] 'save-buffer)
;; macros
(global-set-key [f10] 'start-kbd-macro)
(global-set-key [f11] 'end-kbd-macro)
(global-set-key [f12] 'call-last-kbd-macro)
;;-------------------------------------------------------------------------------
;; mini buffers
;;-------------------------------------------------------------------------------
(fset 'yes-or-no-p 'y-or-n-p)
(ido-mode t)
(setq
 ido-save-directory-list-file (concat user-emacs-directory "ido.last")
 ido-ignore-buffers'("\\` " ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "*Backtrace*" "*Messages*" "*Compile-Log*" "*Disabled Command*" "*fsm-debug*" "*Buffer List*")
 ido-case-fold t
 ido-enable-last-directory-history t
 ido-use-filename-at-point nil
 ido-use-url-at-point nil
 ido-enable-last-directory-history t
 ido-max-prospects 8
 )
;;-------------------------------------------------------------------------------
;; w3m
;;-------------------------------------------------------------------------------
(setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-default-display-inline-images t)
(setq w3m-use-cookies t)
;;-------------------------------------------------------------------------------
;; jabber
;;-------------------------------------------------------------------------------
;; (setq jabber-account-list '((""
;; (:password . "")
;; (:network-server . "jabber.ru")
;; (:port . 443)
;; (:connection-type . ssl))
(require 'my-jabber-settings)
(setq jabber-vcard-avatars-retrieve nil)
(setq jabber-auto-reconnect t)
(setq jabber-history-enabled t)
(setq jabber-history-size-limit 1024)
(setq jabber-history-dir (concat user-emacs-directory "jabber-history"))
(add-hook 'jabber-chat-mode-hook 'flyspell-mode)
					; notification
(defvar libnotify-program "/usr/bin/notify-send")
(defun notify-send (title message)
  (start-process "notify" " notify"
		 libnotify-program "--expire-time=4000" title message))
(defun libnotify-jabber-notify (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via libnotify"
  (when (or jabber-message-alert-same-buffer
	    (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
	(notify-send (format "(PM) %s"
			     (jabber-jid-displayname (jabber-jid-user from)))
		     (format "%s: %s" (jabber-jid-resource from) text)))
    (notify-send (format "%s" (jabber-jid-displayname from))
		 text)))
(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)
;;-------------------------------------------------------------------------------
;; modes
;;-------------------------------------------------------------------------------
;; haskell mode
;; (require 'company)
;; (add-hook 'haskell-mode-hook 'company-mode)
;(dolist (module '(turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indentation))
;  (add-hook 'haskell-mode-hook module))
(dolist (x '(("\\.lucius\\'" . css-mode)
	     ("\\.julius\\'" . javascript-mode)
	     ("\\.hamlet\\'" . html-mode)))
  (add-to-list 'auto-mode-alist x))
					; ghc-mod
;; (autoload 'ghc-init "ghc" nil t)
;; (autoload 'ghc-debug "ghc" nil t)
;; (add-hook 'haskell-mode-hook
;; 	  (lambda () (progn (ghc-init)
;; 			    (add-to-list 'ac-sources 'ac-source-ghc-mod)
;; 			    (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
;; 			    (local-set-key (kbd "C-c M-c") 'ghc-check-syntax)
;; 			    (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;; 			    )))
;; (defvar cabal-use-sandbox nil)
;; (defun cabal-toggle-sandboxing ()
;; (interactive)
;; (setq cabal-use-sandbox (not cabal-use-sandbox))
;; (if cabal-use-sandbox
;; (setq haskell-program-name "cabal repl")
;; (setq haskell-program-name "ghci"))
;; (message (format "haskell-program-name is %s"
;; (if cabal-use-sandbox
;; "cabal repl"
;; "ghci"))))

;; c mode
(setq c-default-style "linux"
      c-basic-offset 4)
(c-set-offset 'arglist-intro '+)
;; ORG mode
(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))
(defun org-mode-hook-fn ()
  (toggle-truncate-lines)
  (toggle-word-wrap)
  (setq org-log-done 'time)
  (local-set-key (kbd "C-c d") 'insert-date)
  (local-set-key "\C-cl" 'org-store-link)
  (local-set-key "\C-ca" 'org-agenda)
  
  (setq org-todo-keywords
	'(
	  (sequence "TODO(t)" "WAIT" "|" "CANCELED(c)" "DONE(d)")
	  (sequence "TOREAD" "READING" "|" "READ")
	  ))
  
  (setq org-todo-keyword-faces
	'(
	  ("TODO" . (:foreground "red" :weight bold))
	  ("TOREAD" . (:foreground "red" :weight bold))
	  ("CANCELED" . (:foreground "orange" :weight bold))
	  ("READING" . (:background "blue" :weight bold))
	  ("WAIT" . (:foreground "orange" :weight bold))
	  ))
  )
(add-hook 'org-mode-hook 'org-mode-hook-fn)
;; lisp mode
(defun pretty-greek ()
  (let ((greek '("alpha" "beta" "gamma" "delta" "epsilon" "zeta" "eta" "theta" "iota" "kappa" "lambda" "mu" "nu" "xi" "omicron" "pi" "rho" "sigma_final" "sigma" "tau" "upsilon" "phi" "chi" "psi" "omega")))
    (loop for word in greek
	  for code = 97 then (+ 1 code)
	  do (let ((greek-char (make-char 'greek-iso8859-7 code)))
	       (font-lock-add-keywords nil
				       `((,(concatenate 'string "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[a-zA-Z]")
					  (0 (progn (decompose-region (match-beginning 2) (match-end 2))
						    nil)))))
	       (font-lock-add-keywords nil
				       `((,(concatenate 'string "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[^a-zA-Z]")
					  (0 (progn (compose-region (match-beginning 2) (match-end 2)
								    ,greek-char)
						    nil)))))))))
(dolist (mode '(scheme-mode-hook lisp-mode-hook emacs-lisp-mode-hook))
  (add-hook mode 'pretty-greek))
(define-key lisp-mode-shared-map (kbd "C-c l") "lambda")
;; perl mode
(require 'cperl-mode)
(defalias 'perl-mode 'cperl-mode)
(setq cperl-hairy t)
(cperl-set-style "C++")
;; load custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(fci-rule-color "#073642")
 '(global-undo-tree-mode t)
 '(haskell-decl-scan-bindings-as-variables t)
 '(haskell-doc-show-global-types t)
 '(haskell-doc-use-inf-haskell t)
 '(haskell-font-lock-haddock t)
 '(haskell-font-lock-symbols t)
 '(haskell-mode-hook
   (quote
    (capitalized-words-mode imenu-add-menubar-index turn-on-eldoc-mode turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indent turn-on-haskell-indentation turn-on-haskell-simple-indent)))
 '(haskell-program-name "ghci -Wall")
 '(haskell-stylish-on-save nil)
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(undo-tree-auto-save-history nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(warning-suppress-types '((initialization )))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(require 'css-sort)
