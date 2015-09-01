;; This is for the autocompletion in ESS
(require 'ess)
(setq ess-use-auto-complete t)
(setq ess-use-auto-complete 'script-only)

;; (setq ac-auto-show-menu nil
;;       ac-candidate-limit nil
;;       ac-delay 0.3
;;       ac-menu-height 10
;;       ac-quick-help-delay 1
;;       ac-quick-help-prefer-pos-tip t
;;       ac-use-quick-help t)

(setq ess-indent-level 2)
(setq ess-eval-visibly-p nil) ; otherwise C-c C-r (eval region) takes forever

(setq ess-ask-for-ess-directory nil) ; otherwise you are prompted each time you start an interactive R session

(setq ess-local-process-name "R")
(setq ansi-color-for-comint-mode 'filter)
(setq comint-prompt-read-only t)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(ess-set-style 'OWN)

(defun my-ess-start-R ()
  (interactive)
  (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
      (progn (let ((f1 (selected-frame)))
               (select-frame (make-frame '((width . 100)
                                           (height . 67))))
               (R)
               (select-frame f1)))))

(defun my-ess-eval ()
  (interactive)
  (my-ess-start-R)
  (if (and transient-mark-mode mark-active)
      (call-interactively 'ess-eval-region)
    (call-interactively 'ess-eval-line-and-step)))

(add-hook 'ess-mode-hook
          '(lambda()
             (local-set-key (kbd "<C-dead-circumflex>") 'my-ess-eval)
             (setq ess-indent-level 2)
             (rainbow-mode t)
             (rainbow-delimiters-mode t)))

(add-hook 'inferior-ess-mode-hook
          '(lambda()
             (local-set-key [C-up] 'comint-previous-input)
             (local-set-key [C-down] 'comint-next-input)
             (rainbow-mode t)
             (rainbow-delimiters-mode t)))

(require 'ess-site)

;; To clear the shell in R
(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

;; To reset the size of the terminal in R in ESS use C-c w to reset the size of the console
(defun my-ess-post-run-hook ()
  (ess-execute-screen-options)
  (local-set-key "\C-cw" 'ess-execute-screen-options))
(add-hook 'ess-post-run-hook 'my-ess-post-run-hook)

;; Rmd Part
;; Need the polymode-mode in package-list-package
;; R related Mode

(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode)) ;; Sweave
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode)) ;; Knitr + Latex
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode)) ;; Rmd
(add-to-list 'auto-mode-alist '("\\.Rcpp" . poly-r+c++-mode))
(add-to-list 'auto-mode-alist '("\\.cppR" . poly-c++r-mode))


(require 'dash)
(defun r-settings-open-other-extension ()
  (let ((file-name (substring buffer-file-name 0 -4)))
    (-map (lambda (x)
            (let* ((ext (car x))
                   (viewer (nth 1 x))
                   (file-path (concat file-name ext)))
              (when (file-exists-p file-path)
                (start-process (concat file-path "-viewer") file-path
                               viewer file-path))))
          '((".pdf" "evince") (".html" "google-chrome")))))

;; Rmd to Html (assume you have google-chrome)
(defun r-rmd-render ()
  "Run rmarkdown:render on the current file"
  (interactive)
  (shell-command (format "Rscript -e \"rmarkdown::render('%s', 'all')\""
                         (shell-quote-argument (buffer-file-name))))
  (r-settings-open-other-extension))
;; Rmd slidify to Html  (assume you have google-chrome)

(defun r-slidifiy ()
  "Run slidify::slidify on the current file"
  (interactive)
  (shell-command (format "Rscript -e \"slidify::slidify('%s')\""
                         (shell-quote-argument (buffer-file-name))))
  (r-settings-open-other-extension))


;; Insert chunk in .Rmd files
(defun rmd-insert-chunk ()
  "Insert rchunk for .Rmd files"
  (interactive)
  (if (region-active-p) (save-excursion
                          (goto-char (region-end)) (insert "\n```")
                          (goto-char (region-beginning)) (insert "```{r}\n"))
    ((lambda () (insert "```{r}\n\n```") (forward-line -1)))))

(add-hook 'markdown-mode-hook
  (lambda () (local-set-key (kbd "C-c C-e") 'r-rmd-render)
    (local-set-key (kbd "<C-dead-circumflex>") 'rmd-insert-chunk)))
