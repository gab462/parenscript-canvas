(require 'uiop)

(ensure-directories-exist (merge-pathnames ".qlenv/" (uiop/os:getcwd)))

(uiop:run-program '("curl" "https://beta.quicklisp.org/quicklisp.lisp" "-so" ".qlenv/quicklisp.lisp"))

(load ".qlenv/quicklisp.lisp")

(quicklisp-quickstart:install :path ".qlenv/quicklisp/")
