;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Harsha Pathuri"
      user-mail-address "harshapathuri86@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Iosevka" :size 15 :weight 'normal))
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory (expand-file-name "~/Documents/org"))
(setq org-agenda-files (list org-directory))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-roam-directory (expand-file-name "~/Documents/org/notes" ))
(setq org-log-done 'time )
;; (setq org-log-done 'note )

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq
 doom-modeline-enable-word-count t
 doom-modeline-github t
 doom-modeline-major-mode-icon t)

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      make-backup-files t
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2)                            ; It's nice to maintain a little margin

(display-time-mode 1)                             ; Enable time in the mode-line

(unless (string-match-p "^Power N/A" (battery))   ; On laptops...
  (display-battery-mode 1))                       ; it's nice to know how much power you have

(global-subword-mode 1)                           ; Iterate through CamelCase words

;;twit
(setq twittering-allow-insecure-server-cert t)

;; splits
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after

 '(evil-window-split evil-window-vsplit)
  (consult-buffer))


(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

(setq fancy-splash-image "~/.doom.d/splash.png")
(setq +doom-dashboard-banner-padding '(0 . 1))
;; (setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 2))
;; (defun +doom-dashboard-setup-modified-keymap ()
;;   (setq +doom-dashboard-mode-map (make-sparse-keymap))
;;   (map! :map +doom-dashboard-mode-map
;;         :desc "Find file" :ne "f" #'find-file
;;         :desc "Recent files" :ne "r" #'consult-recent-file
;;         :desc "Config dir" :ne "C" #'doom/open-private-config
;;         :desc "Open dotfile" :ne "." (cmd! (doom-project-find-file "~/.config/"))
;;         :desc "Notes (roam)" :ne "n" #'org-roam-node-find
;;         :desc "Switch buffer" :ne "b" #'+vertico/switch-workspace-buffer
;;         :desc "Switch buffers (all)" :ne "B" #'consult-buffer
;;         :desc "IBuffer" :ne "i" #'ibuffer
;;         :desc "Previous buffer" :ne "p" #'previous-buffer
;;         :desc "Set theme" :ne "t" #'consult-theme
;;         :desc "Quit" :ne "Q" #'save-buffers-kill-terminal
;;         :desc "Show keybindings" :ne "h" (cmd! (which-key-show-keymap '+doom-dashboard-mode-map))))

;; (add-transient-hook! #'+doom-dashboard-mode (+doom-dashboard-setup-modified-keymap))
;; (add-transient-hook! #'+doom-dashboard-mode :append (+doom-dashboard-setup-modified-keymap))
;; (add-hook! 'doom-init-ui-hook :append (+doom-dashboard-setup-modified-keymap))


(map! :leader :desc "Dashboard" "d" #'+doom-dashboard/open)


;; mouse buttons
(map! :n [mouse-8] #'better-jumper-jump-backward
      :n [mouse-9] #'better-jumper-jump-forward)

(if (eq initial-window-system 'x)                 ; if started by emacs command or desktop file
    (toggle-frame-maximized)
  (toggle-frame-fullscreen))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d!)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c@)")))
;; ! time stamp @-> note @/! -> note while entering and timestamp while leaving
;; https://orgmode.org/manual/Tracking-TODO-state-changes.html

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

;; no extra workspace for client
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

;; presentation
;;(with-eval-after-load "org-tree-slide"
;;  (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
;;  (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree))
;;(define-key org-mode-map (kbd "<f8>") 'org-tree-slide-mode)
;;(define-key org-mode-map (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
;;(define-key org-tree-slide-mode-map (kbd "<f11>") 'org-tree-slide-content)
;;(setq org-tree-slide-skip-outline-level
;;      org-tree-slide-skip-done nil)

;; Set transparency of emacs
(defun transparency (value)
"Sets the transparency of the frame window. 0=transparent/100=opaque"
(interactive "nTransparency Value 0 - 100 opaque:")
(set-frame-parameter (selected-frame) 'alpha value))

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)

;; (set-frame-parameter (selected-frame) 'alpha '(100 . 85))
;; (add-to-list 'default-frame-alist '(alpha . (95 . 85)))

;; (defun toggle-transparency ()
;; (interactive)
;; (let ((alpha (frame-parameter nil 'alpha)))
;; (set-frame-parameter
;; nil 'alpha
;; (if (eql (cond ((numberp alpha) alpha)
;;                 ((numberp (cdr alpha)) (cdr alpha))
;;                 ;; Also handle undocumented (<active> <inactive>) form.
;;                 ((numberp (cadr alpha)) (cadr alpha)))
;;         100)
;;         '(85 . 50) '(100 . 100)))))
;; (global-set-key (kbd "C-c t") 'toggle-transparency)

;; https://tecosaur.github.io/emacs-config/config.html
