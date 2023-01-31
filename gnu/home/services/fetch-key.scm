(use-modules 
  (ice-9 receive)
  (web client)
  (ice-9 binary-ports))

(define (meta-data path)
  (let ((uri (string-append "https://ka0x.com/" path)))
    (receive (header body)
        (http-get uri #:decode-body? #f)
      body)))

(let* ((pubkey (meta-data "public-key")))
  (call-with-output-file "/etc/ssh/authorized_keys.d/template"
    (lambda (port)
      (put-bytevector port pubkey))))

;;; fetch-key.scm ends here
