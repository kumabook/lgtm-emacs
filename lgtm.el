;;; lgtm.el --- lgtm.in client

;; Copyright (C) 2015 Hiroki Kumamoto

;; Author: HirokiKumamoto <kumabook@live.jp>
;; Version: 0.1
;; Package-Requires: ((request "1.0"))
;; Keywords: multimedia, frobnicate
;; URL: https://github.com/kumabook/lgtm-emacs

;;; Commentary:

;; This package provides a minor mode to frobnicate and/or
;; bifurcate any flanges you desire.  To activate it, just type

;;; Code:

(require 'url)
(require 'json)
(require 'request)

(defun lgtm ()
  "Show a LGTM image from lgtm.in at random"
  (interactive)
  (request
   "http://www.lgtm.in/g"
   :type "GET"
   :params '()
   :parser 'json-read
   :headers '(("Accept" . "application/json"))
   :success (function*
             (lambda (&key data &allow-other-keys)
               (kill-buffer (get-buffer-create "*lgtm*"))
               (switch-to-buffer (get-buffer-create "*lgtm*"))
               (insert-image-from-url (assoc-default 'actualImageUrl data))
               (insert "\n")
               (insert (assoc-default 'markdown data))))))

(defun insert-image-from-url (url)
  (let ((buffer (url-retrieve-synchronously url)))
    (unwind-protect
        (let ((data (with-current-buffer buffer
                      (goto-char (point-min))
                      (search-forward "\n\n")
                      (buffer-substring (point) (point-max)))))
          (insert-image (create-image data nil t)))
      (kill-buffer buffer))))

(provide 'lgtm)

;;;###Autoload

;;; lgtm.el ends here
