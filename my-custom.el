(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(geiser-active-implementations (quote (racket guile chicken chez mit chibi)))
 '(geiser-default-implementation (quote racket))
 '(my-info-alist (quote ((my-name . "") (my-email . ""))))
 '(org-capture-templates
   (quote
    (("t" "todo" entry
      (file+headline "~/org/todo.org" "Tasks")
      "* TODO [#A] %? SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))")
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
     ("stembase.space" . 115))))
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
