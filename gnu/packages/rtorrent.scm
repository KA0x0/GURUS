(use-modules (guix packages) (gcrypt hash))
(use-modules (gnu packages bittorrent))

(define my-libtorrent
  (package
    (inherit libtorrent)
    (version "0.13.8")
    (source (sha256
               (base32
                "10z9i1rc41cmmi7nx8k7k1agsx6afv09g9cl7g9zr35fyhl5l4gd")))))    

(define my-rtorrent
  (package
    (inherit rtorrent)
    (version "0.9.8")
    (source (sha256
               (base32
                "1bs2fnf4q7mlhkhzp3i1v052v9xn8qa7g845pk9ia8hlpw207pwy")))
    (inputs (list my-libtorrent))))