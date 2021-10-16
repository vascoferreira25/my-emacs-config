;; -*- lexical-binding: t; -*-
(require 'dash)
(require 's)
(require 'request)


(defun print-org-elements ()
  (interactive)
  (org-element-map (org-element-parse-buffer) 'drawer
    (lambda (element)
      (print element))))

(defun print-org-properties ()
  (interactive)
  (print (org-entry-properties)))

(defun print-org-element-at-point ()
  (interactive)
  (print (org-element-at-point)))



(alert-toast-notify '(:title "Emacs" :message "This is a message" :data (:long t :audio alarm2)))



(defun mkdir-p (file &optional dir)
  "Create any parent directories of FILE if missing and return FILE."
  (make-directory (file-name-directory file) (or dir ".")) file)

(add-hook 'org-babel-pre-tangle-hook )








(setq switch-to-buffer-obey-display-actions t)
