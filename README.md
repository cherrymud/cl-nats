
![cl-nats logo](https://github.com/tormaroe/cl-nats/blob/master/images/cl-nats-logo.png)

# NATS - Common Lisp Client

A Common Lisp client for the [NATS messaging system](https://nats.io/), providing low latency publish/subscribe over TCP sockets.

[![License MIT](https://img.shields.io/npm/l/express.svg)](http://opensource.org/licenses/MIT) ![beta](https://img.shields.io/badge/project%20state-beta-orange.svg)

## Installation

cl-nats is not available through quicklisp yet, so clone this repository to some location where quicklisp can find it, and then run:

    (ql:quickload :cl-nats)

## Basic Usage

    (defvar conn (nats:make-connection))

    ;; Simple Subscriber
    (nats:publish conn "foo" "Hello World!")

    ;; Simple Subscriber
    (nats:subscribe conn "foo"
      (lambda (msg &key context)
        (format t "Received a message: ~S~%" msg)))

    ;; Unsubscribing
    (defvar sid (nats:subscribe conn "foo"
                  (lambda (msg)
                    (declare (ignore msg)))))
    (nats:unsubscribe conn sid)

    ;; Close connection
    (nats:close conn)

You will find more usage examples in the examples source directory. Refer to the [NATS documentation](http://nats.io/documentation/) for a deeper understanding.

View the `nats` package exported symbols for the public API of cl-nats. Note that the exported symbols of `nats.connection` and `nats.vars` are re-exported in `nats`.

## Dependencies

Not that you should need to care about this, but under the hood cl-nats uses:

* [usocket](https://common-lisp.net/project/usocket/) - Universal socket library
* [flexi-streams](http://weitz.de/flexi-streams/) - Flexible bivalent streams
* [bordeaux-threads](https://common-lisp.net/project/bordeaux-threads/) - Portable shared-state concurrency
* [cl-json](https://common-lisp.net/project/cl-json/) - A JSON parser and generator
* [cl-ppcre](http://weitz.de/cl-ppcre/) - Portable Perl-compatible regular expressions
* [rutils](https://github.com/vseloved/rutils) - Radical Utilities

## License

(The MIT License)

Copyright (c) 2016 Torbjørn Marø

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
