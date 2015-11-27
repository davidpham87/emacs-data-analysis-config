
(require 'package)
(require 'cl)
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t))

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)

(defvar ac-pckgs
  '(auto-complete
    auto-complete-auctex
    auto-complete-c-headers
    ac-html
    ac-html-bootstrap
    ac-html-csswatcher
    org-ac
    popup                               ; popup for autocomplete
    company
    company-auctex
    company-jedi
    company-quickhelp                   ; M-h quick-help in company
    pos-tip                             ; popup for company-quickhelp
    )
  "Autocomplete packages")

(defvar color-pckgs
  '(color-theme                         ; color-theme management
    zenburn-theme                       ; A low contrast color theme for Emacs.
    rainbow-mode                        ; Colorize color names in buffers
    rainbow-delimiters                  ; Highlight parenthesis with their
                                        ; depth
    )
  "Colors packages to ensure are installed at launch.")

(defvar clojure-pckgs
  '(
    cider                               ; Better version
    )
  "Clojure packages for emacs")

(defvar elisp-pckgs
  '(dash                                ; modern list language
    s                                   ; string operation
    ht                                  ; hash tables
    loop                                ; loops
    let-alist                           ; let function for assoricative list # kind of let [:keywords amap] in clojure
    log4e                               ; logging framework
    queue                               ; queue data structure
    yaxception                          ; exception style to elisp
    deferred                            ; deffered
    epl                                 ; epl
    use-package                         ; package administration
    )
  "Elisp packages to make coding in elisp easier.")

(defvar fly-pckgs
  '(flycheck
    google-c-style                      ; Google's C/C++ style for c-mode
    flycheck-google-cpplint             ; add setup code
    flymake-easy
    flymake-google-cpplint
    flymake-python-pyflakes             ;
    )
  "Fly packages to checks syntax or spell cheking.")

(defvar markup-pckgs
  '(auctex                              ; default LaTeX mode
    latex-extra                         ; some cool features for LaTeX
    haml-mode
    markdown-mode                       ; markdown packages
    markdown-mode+                      ; extra functions for the markdown
    pandoc-mode                         ; convert from markup language
    emmet-mode                          ; html/haml zen-coding
    )
  "A list of package for markup language")

(defvar other-pckgs
  '(ess                                 ; require apt-get update/upgrade
    multiple-cursors                    ;
    paredit                             ; parenthesis manager
    projectile                          ; manage projects
    polymode                            ; several mode per buffer
    buffer-move                         ; swap-windows command for buffer
    edit-server                         ; writting e-mail with emacs
    websocket                           ; websocket for markdown-preview
    )
  "A list of packages to ensure are installed at launch.")

(defvar python-pckgs
  '(jedi                                ; Python auto-completion in Emacs
    jedi-core                           ; elisp code for jedi
    pylint                              ; check with pytlint
    python-environment                  ; python environment virtual-env
    )
  "Python packages to ensure are installed at launch.")

(defvar my-packages
  (append ac-pckgs color-pckgs clojure-pckgs elisp-pckgs fly-pckgs
          markup-pckgs other-pckgs python-pckgs)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))
