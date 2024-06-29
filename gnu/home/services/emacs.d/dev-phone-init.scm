(define-public dev-phone-init
  ;; Theme
  (load-theme 'modus-vivendi)

  ;; UI
  (menu-bar-mode 0)
  (toggle-scroll-bar 0)
  (tool-bar-mode 0)
  (blink-cursor-mode 0)
  (column-number-mode)

  ;; Fonts
  (set-frame-font "fira code 12" nil t)
  ;; Enable the www ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))

  (defun shrug ()
  "insert /shrug ascii at point"
	  (interactive)
	  (insert "¯\_(ツ)_/¯"))

  (defun tableflip ()
  "insert /tableflip ascii at point"
	  (interactive)
	  (insert "(╯° °）╯︵ ┻━┻"))

  ;; Enable ligatures in programming modes                                                           
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                       ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                       "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                       "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                       "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                       "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                       "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                       "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                       "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

  (global-ligature-mode 't)

  ;;; dev-phone-init ends here\n
)