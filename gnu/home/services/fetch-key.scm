;;; Code:

(use-modules 
  (ice-9 receive)
  (web client)
  (ice-9 binary-ports))

(define (meta-data path)
  (let ((uri (string-append "https://ka0x.com/ka0x.pub" path)))
    (receive (header body)
        (http-get uri #:decode-body? #f)
      body)))

(let* ((pubkey (meta-data "public-key")))
  (call-with-output-file "/etc/ssh/authorized_keys.d/ka0x.pub"
    (lambda (port)
      (put-bytevector port pubkey))))

;;; fetch-key.scm ends here
