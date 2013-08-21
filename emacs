;; Hooks
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)                              ; math mode for LaTeX
(add-hook `latex-mode-hook `flyspell-mode)                                ; spellcheck in LaTeX mode
(add-hook `tex-mode-hook `flyspell-mode)                                  ; spellcheck in LaTeX mode
(add-hook `bibtex-mode-hook `flyspell-mode)                               ; spellcheck in LaTeX mode
(add-hook 'text-mode-hook '(lambda nil
  (auto-fill-mode 1)                                                      ; turn on auto-fill-mode
  (setq fill-column 100)))                                                ; set fill column at 100


;; Mouse, keyboard, and scrolling
(mouse-wheel-mode t)                                                      ; enable mouse
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))                      ; scroll one line at a time
(setq mouse-wheel-scroll-amount '(1))                                     ; scroll one line at a time
(setq mouse-wheel-progressive-speed nil)                                  ; Don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                                        ; Scroll window under mouse
(setq scroll-step 1)                                                      ; keyboard scroll one line at a time
(setq scroll-preserve-screen-position t)                                  ; preserve screen position after page-up / page-down


;; Appearance
(line-number-mode 1)                                                      ; show line number in the mode line
(column-number-mode 1)                                                    ; show column number in the mode line
(set-face-attribute 'default nil :font "Inconsolata" :height 100)         ; set default font to Inconsolata, 10pt
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)                          ; turn on auto-fill-mode
;; (setq-default fill-column 100)                                         ; set fill column at 100


;; Indentation, tabs
(setq-default indent-tabs-mode nil)                                       ; indent with spaces only (global)
(setq default-tab-width 2)                                                ; set tab width to 2
(setq standard-indent 2)                                                  ; set standard indent to 2


;; Backup files
(setq make-backup-files t)                                                ; enable backup files
(setq version-control t)                                                  ; enable versioning with default values
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))      ; put backup files in this directory


;; Deletion and Killing
(delete-selection-mode t)
