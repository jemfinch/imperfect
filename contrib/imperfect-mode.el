;;; imperfect-mode.el --- Mode for the imperfect programming language

;; Copyright (C) 2011  Jeremy Fincher

;; Author: Jeremy Fincher <jeremy@finchers.us>
;; Keywords: I don't know what the heck these are.

;; LICENSE

;;; Commentary:

;; 

;;; Code:

(provide 'imperfect-mode)

(defvar imperfect-mode-hook nil)

(defvar imperfect-mode-map (make-keymap)
  "Keymap for Imperfect major mode")

(add-to-list 'auto-mode-alist '("\\.imp\\'" . imperfect-mode))
(add-to-list 'auto-mode-alist '("\\.i\\'" . imperfect-mode))


(defconst imperfect-font-lock-keywords-1
  (list
   `(,(regexp-opt '("abstract"
                    "case"
                    "consumes"
                    "derive"
                    "ensures"
                    "export"
                    "if"
                    "implementation"
                    "import"
                    "interface"
                    "function"
                    "method"
                    "modifies"
                    "operator"
                    "procedure"
                    "produces"
                    "requires"
                    "type"
                    "while") t) . font-lock-keyword-face)
   `(,(regexp-opt '("true"
                    "false") t) . font-lock-constant-face)
   '("\\<[A-Z][A-Za-z0-9]*\\>" . font-lock-type-face)
   '("\\<[a-z_][a-z0-9_]*\\>" . font-lock-variable-face))
  "Minimal highlighting expressions for Imperfect mode")

(regexp-opt '("abstract"
              "case"
              "consumes"
              "derive"
              "ensures"
              "export"
              "if"
              "implementation"
              "import"
              "interface"
              "function"
              "method"
              "modifies"
              "operator"
              "procedure"
              "produces"
              "requires"
              "type"
              "while") t)

(defvar imperfect-mode-syntax-table (make-syntax-table)
  "Syntax table for imperfect-mode")

(defun imperfect-mode ()
  "Major mode for editing Imperfect programming language files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table imperfect-mode-syntax-table)
  (use-local-map imperfect-mode-map)
  (set (make-local-variable 'font-lock-defaults) 
       '(imperfect-font-lock-keywords-1))
  (setq major-mode 'imperfect-mode)
  (setq mode-name "Imperfect")
  (run-hooks 'imperfect-mode-hook))

;;; imperfect-mode.el ends here

