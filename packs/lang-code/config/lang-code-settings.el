(eval-after-load "speedbar"
  (lambda ()
    (mapc 'speedbar-add-supported-extension '(".clj" ".cljs" ".r"))))
