;;;; cl-nats.asd

(asdf:defsystem #:cl-nats
  :version "0.1.1"
  :description "NATS client library"
  :author "Torbjørn Marø <torbjorn.maro@gmail.com>"
  :license "MIT"
  :depends-on (#:usocket #:flexi-streams #:bordeaux-threads
               #:cl-json #:cl-ppcre #:rutils #:chanl)
  :components ((:file "packages")
               (:file "lib/json-false")
               (:file "nats.subject" :depends-on ("packages"))
               (:file "nats.connection" :depends-on ("packages"))
               (:file "nats.vars" :depends-on ("packages"))
               (:file "nats.io" :depends-on ("lib/json-false"
                                             "packages"
                                             "nats.connection"
                                             "nats.vars"))
               (:file "nats" :depends-on ("packages"
                                          "nats.subject"
                                          "nats.connection"
                                          "nats.vars"
                                          "nats.io"))))
