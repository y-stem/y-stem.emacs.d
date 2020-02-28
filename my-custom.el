(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(auto-insert-alist
   (quote
    (("poolchem.org?\\'" .
      ["poolchem.org" my-eval-auto-insert-init-form])
     ("\\.org?$" .
      ["default-org.org" "default-org.org" "default-org.org"])
     (("\\.\\([Hh]\\|hh\\|hpp\\|hxx\\|h\\+\\+\\)\\'" . "C / C++ header")
      (replace-regexp-in-string "[^A-Z0-9]" "_"
				(replace-regexp-in-string "\\+" "P"
							  (upcase
							   (file-name-nondirectory buffer-file-name))))
      "#ifndef " str n "#define " str "

" _ "

#endif")
     (("\\.\\([Cc]\\|cc\\|cpp\\|cxx\\|c\\+\\+\\)\\'" . "C / C++ program")
      nil "#include \""
      (let
	  ((stem
	    (file-name-sans-extension buffer-file-name))
	   ret)
	(dolist
	    (ext
	     (quote
	      ("H" "h" "hh" "hpp" "hxx" "h++"))
	     ret)
	  (when
	      (file-exists-p
	       (concat stem "." ext))
	    (setq ret
		  (file-name-nondirectory
		   (concat stem "." ext))))))
      & 34 | -10)
     (("[Mm]akefile\\'" . "Makefile")
      . "makefile.inc")
     (html-mode lambda nil
		(sgml-tag "html"))
     (plain-tex-mode . "tex-insert.tex")
     (bibtex-mode . "tex-insert.tex")
     (latex-mode "options, RET: " "\\documentclass[" str & 93 | -1 123
		 (read-string "class: ")
		 "}
"
		 ("package, %s: " "\\usepackage["
		  (read-string "options, RET: ")
		  & 93 | -1 123 str "}
")
		 _ "
\\begin{document}
" _ "
\\end{document}")
     (("/bin/.*[^/]\\'" . "Shell-Script mode magic number")
      lambda nil
      (if
	  (eq major-mode
	      (default-value
		(quote major-mode)))
	  (sh-mode)))
     (ada-mode . ada-header)
     (("\\.[1-9]\\'" . "Man page skeleton")
      "Short description: " ".\\\" Copyright (C), "
      (format-time-string "%Y")
      "  "
      (getenv "ORGANIZATION")
      |
      (progn user-full-name)
      "
.\\\" You may distribute this file under the terms of the GNU Free
.\\\" Documentation License.
.TH "
      (file-name-base)
      " "
      (file-name-extension
       (buffer-file-name))
      " "
      (format-time-string "%Y-%m-%d ")
      "
.SH NAME
"
      (file-name-base)
      " \\- " str "
.SH SYNOPSIS
.B "
      (file-name-base)
      "
" _ "
.SH DESCRIPTION
.SH OPTIONS
.SH FILES
.SH \"SEE ALSO\"
.SH BUGS
.SH AUTHOR
"
      (user-full-name)
      (quote
       (if
	   (search-backward "&"
			    (line-beginning-position)
			    t)
	   (replace-match
	    (capitalize
	     (user-login-name))
	    t t)))
      (quote
       (end-of-line 1))
      " <"
      (progn user-mail-address)
      ">
")
     (("\\.el\\'" . "Emacs Lisp header")
      "Short description: " ";;; "
      (file-name-nondirectory
       (buffer-file-name))
      " --- " str
      (make-string
       (max 2
	    (- 80
	       (current-column)
	       27))
       32)
      "-*- lexical-binding: t; -*-"
      (quote
       (setq lexical-binding t))
      "

;; Copyright (C) "
      (format-time-string "%Y")
      "  "
      (getenv "ORGANIZATION")
      |
      (progn user-full-name)
      "

;; Author: "
      (user-full-name)
      (quote
       (if
	   (search-backward "&"
			    (line-beginning-position)
			    t)
	   (replace-match
	    (capitalize
	     (user-login-name))
	    t t)))
      (quote
       (end-of-line 1))
      " <"
      (progn user-mail-address)
      ">
;; Keywords: "
      (quote
       (require
	(quote finder)))
      (quote
       (setq v1
	     (mapcar
	      (lambda
		(x)
		(list
		 (symbol-name
		  (car x))))
	      finder-known-keywords)
	     v2
	     (mapconcat
	      (lambda
		(x)
		(format "%12s:  %s"
			(car x)
			(cdr x)))
	      finder-known-keywords "
")))
      ((let
	   ((minibuffer-help-form v2))
	 (completing-read "Keyword, C-h: " v1 nil t))
       str ", ")
      & -2 "

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; " _ "

;;; Code:



(provide '"
      (file-name-base)
      ")
;;; "
      (file-name-nondirectory
       (buffer-file-name))
      " ends here
")
     (("\\.texi\\(nfo\\)?\\'" . "Texinfo file skeleton")
      "Title: " "\\input texinfo   @c -*-texinfo-*-
@c %**start of header
@setfilename "
      (file-name-base)
      ".info
" "@settitle " str "
@c %**end of header
@copying
"
      (setq short-description
	    (read-string "Short description: "))
      ".

" "Copyright @copyright{} "
      (format-time-string "%Y")
      "  "
      (getenv "ORGANIZATION")
      |
      (progn user-full-name)
      "

@quotation
Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.3
or any later version published by the Free Software Foundation;
with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
A copy of the license is included in the section entitled ``GNU
Free Documentation License''.

A copy of the license is also available from the Free Software
Foundation Web site at @url{https://www.gnu.org/licenses/fdl.html}.

@end quotation

The document was typeset with
@uref{http://www.texinfo.org/, GNU Texinfo}.

@end copying

@titlepage
@title " str "
@subtitle " short-description "
@author "
      (getenv "ORGANIZATION")
      |
      (progn user-full-name)
      " <"
      (progn user-mail-address)
      ">
@page
@vskip 0pt plus 1filll
@insertcopying
@end titlepage

@c Output the table of the contents at the beginning.
@contents

@ifnottex
@node Top
@top " str "

@insertcopying
@end ifnottex

@c Generate the nodes for this menu with `C-c C-u C-m'.
@menu
@end menu

@c Update all node entries with `C-c C-u C-n'.
@c Insert new nodes with `C-c C-c n'.
@node Chapter One
@chapter Chapter One

" _ "

@node Copying This Manual
@appendix Copying This Manual

@menu
* GNU Free Documentation License::  License for copying this manual.
@end menu

@c Get fdl.texi from https://www.gnu.org/licenses/fdl.html
@include fdl.texi

@node Index
@unnumbered Index

@printindex cp

@bye

@c "
      (file-name-nondirectory
       (buffer-file-name))
      " ends here
"))))
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(geiser-active-implementations (quote (racket guile chicken chez mit chibi)))
 '(geiser-default-implementation (quote racket))
 '(my-info-alist (quote ((my-name . "") (my-email . ""))))
 '(org-capture-templates
   (quote
    (("a" "My TODO task format." entry
      (file "~/org/ccynata/ccynatatasks.org")
      "* TODO %? SCHEDULED: %t")
     ("e" "elisptips" entry
      (file+headline "~/org/elisptips.org" "ElispTips")
      "* %U  %i  %a")
     ("g" "general" entry
      (file "~/org/general.org" "General")
      "* %U  %i  %a"))))
 '(org-footnote-auto-adjust t)
 '(org-html-head-include-default-style nil)
 '(org-html-mathjax-options
   (quote
    ((path "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_HTML")
     (scale "100")
     (align "center")
     (font "Neo-Euler")
     (linebreaks "false")
     (autonumber "AMS")
     (indent "0em")
     (multlinewidth "85%")
     (tagindent ".8em")
     (tagside "right"))))
 '(org-list-allow-alphabetical t)
 '(org-log-into-drawer nil)
 '(org-table-convert-region-max-lines 1999)
 '(org-tag-alist
   (quote
    (("math" . 109)
     ("lisp" . 108)
     ("orgmode" . 111)
     ("wissenschaft" . 119)
     ("kunst" . 107)
     ("informatik" . 105)
     ("philosophie" . 112)
     ("emacs" . 101)
     ("factoid" . 102)
     ("stembase.space" . 115)
     ("natalog" . 97)
     ("natamaint" . 98)
     ("natapump" . 99))))
 '(package-selected-packages
   (quote
    (ess json-mode ac-slime cmake-mode gnuplot flymake-css ac-geiser quack geiser elcord erc-hl-nicks diminish htmlize sudo-edit magit company-shell company-lua company-jedi company-irony company-c-headers flycheck-clang-analyzer company flycheck yasnippet org ox-tufte ox-twbs org-bullets popup-kill-ring zzz-to-char hungry-delete expand-region rainbow-delimiters rainbow-mode beacon mark-multiple avy helm linum-relative swiper switch-window which-key ivy symon fancy-battery spaceline dashboard projectile async pretty-mode zerodark-theme use-package)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(reftex-default-bibliography (quote ("~/org/biblio/ref.bib")))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(user-full-name "Lawrence von Bottorff"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 136 :width normal :foundry "xos4" :family "Terminus"))))
 '(fringe ((t (:background "#292b2e")))))

;;superceded capture template
;; ("t" "todo" entry
;;       (file+headline "~/org/ccynata/ccynatatasks.org" "Tasks")
;;       "* TODO [#A] %? SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))")
