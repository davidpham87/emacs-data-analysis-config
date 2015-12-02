
(setq user-full-name "David Pham"
      user-mail-address "davidpham87@gmail.com")

(package-initialize)

(live-add-packs
 '(packages-management swiss-keyboard  emacs-appearance lang-code))

(setq unwanted-packs '("colour-pack" "org-pack")) ; packs to not load at start.

(require 'cl)                           ; for the search fn
(defun keep-packs? (packs unwanted-packs)
  "Remove elements in elements in unwanted packs if they are
   partially found in packs. E.g. \"colour-packs\" might be
   matched to \"stable/colour-packs\" and hence will be erased. "
  (delq nil (mapcar (lambda (s)
                      (when (not (and (stringp s)
                                      (some (lambda (x) (search x s))
                                            unwanted-packs))) s)) packs)))

(setq live-packs (keep-packs? live-packs unwanted-packs))

(setq dired-guess-shell-alist-user
        '(("\\.pdf$" "evince")
          ("\\.html$" "google-chrome")))
;;; Set the shell instruction for opening your files.
