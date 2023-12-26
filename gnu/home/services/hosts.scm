(simple-service 'my-dns
                    hosts-service-type
                    (list (host "10.0.0.1"
                                "network"
                                "network.home"
                                "network.home.arpa")
                          (host "10.0.0.50"
                                "node"
                                "node.home"
                                "node.home.arpa")))

(simple-service 'my-redirect
                    hosts-service-type
                    (list (host "instagram.com"
                                "")
                          (host "twitter.com"
                                "")
                          (hosts "x.com"
                                "")
                          (host "youtube.com"
                                "")))

(simple-service 'my-adblock
                    hosts-service-type
                    (list (host ""
                                "127.0.0.1")
                          (host ""
                                "127.0.0.1")))