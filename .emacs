;; Hide menu-bar, tool-bar, scroll-bar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Start by loading theme
(load-theme 'wombat)

;; IDO mode
(ido-mode t)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
;; Open working folder at startup
(ido-find-file-in-dir "~/work")

;; PACKAGE
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; USE-PACKAGE
(eval-when-compile
  (require 'use-package))

;; EVIL
(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config ;; tweak evil after loading it
  (evil-mode)

  ;; example how to map a command in normal mode (called 'normal state' in evil)
  (define-key evil-normal-state-map (kbd ", w") 'evil-window-vsplit))

;; AUTO-PAIR
(use-package autopair :ensure t)
(autopair-global-mode)

;; EVIL-SURROUND
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; ORG-BULLETS
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-indent-mode t)) t)

;; LINTER FLYCHECK
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(setq-local flycheck-python-pylint-executable "python3")

;; Always follow symlink
(setq vc-follow-symlinks t)

;; Always show line numbers
(global-linum-mode t)

;; Disable Welcome Window at start
(setq inhibit-startup-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck use-package tabbar org-bullets evil-surround autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
