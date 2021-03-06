;;; Python General configuration these are general config files
;;; found online.
(setq
 python-shell-interpreter "ipython3"
 python-shell-interpreter-args "--pylab --simple-prompt -i"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;;; Just in case you use windows
;; (setq
;;  python-shell-interpreter "C:\\Python27\\python.exe"
;;  python-shell-interpreter-args
;;  "-i C:\\Python27\\Scripts\\ipython-script.py")

;;  Python Pylint
(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)

;;  Python Company JEDI
(add-hook 'python-mode-hook
          (lambda ()
            (company-mode t)
            (company-quickhelp-mode)
            (add-to-list 'company-backends 'company-jedi)))
(setq jedi:complete-on-dot t)
(setq jedi:environment-virtualenv
      (list "virtualenv" "--system-site-packages")) ; Python3

(require 'flymake-python-pyflakes)
;; Python Hook, set indent to 4, and pyflakes
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil tab-width 4 python-indent-offset 4)
            (flymake-python-pyflakes-load)))
