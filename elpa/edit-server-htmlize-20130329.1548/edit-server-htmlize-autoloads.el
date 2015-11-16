;;; edit-server-htmlize-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "edit-server-htmlize" "edit-server-htmlize.el"
;;;;;;  (22083 47094 679521 904000))
;;; Generated autoloads from edit-server-htmlize.el

(defvar edit-server-htmlize-url-regexp (concat "^" (regexp-quote "mail.google.com/mail/")) "\
*Regexp matching `edit-server-url' in a buffer that should be HTMLized.
See `edit-server-maybe-htmlize-buffer'.")

(custom-autoload 'edit-server-htmlize-url-regexp "edit-server-htmlize" t)

(autoload 'edit-server-maybe-htmlize-buffer "edit-server-htmlize" "\
Possibly HTMLize the current buffer of plain text.
This calls `edit-server-htmlize-buffer' if `edit-server-url'
matches `edit-server-htmlize-url-regexp'.

This is intended for use on `edit-server-done-hook'.

\(fn)" t nil)

(autoload 'edit-server-maybe-dehtmlize-buffer "edit-server-htmlize" "\
Possibly deHTMLize the current buffer into plain text.
This calls `edit-server-dehtmlize-buffer-function' if `edit-server-url'
matches `edit-server-htmlize-url-regexp'.

This is intended for use on `edit-server-start-hook'.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; edit-server-htmlize-autoloads.el ends here
