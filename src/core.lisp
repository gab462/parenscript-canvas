(in-package :cl-user)
(defpackage parenscript-canvas.core
  (:use :cl)
  (:export :main :start :stop))
(in-package :parenscript-canvas.core)

(defvar *handler* nil)

(defun handle (env)
  (declare (ignore env))
  `(200
    nil
    (,(let ((script (ps:ps-compile-file "src/paren/core.paren"))
            (style (lass:compile-and-write
                     '(html
                        :background gray
                        :height 100%
                        :display flex
                        :justify-content center
                        :align-items center))))
        (spinneret:with-html-string
          (:doctype)
          (:html
            (:head
              (:title "Probe")
              (:style
                (:raw style)))
            (:body
             (:canvas :id "app" :width "800" :height "600")
             (:script :src "http://localhost:8080/skewer")
              (:script
                (:raw script)))))))))

(defun start (&key (wait nil))
  (setf *handler* (clack:clackup #'handle
                                 :use-thread (not wait))))

(defun stop ()
  (format t "Stopping server...")
  (clack:stop *handler*))

(defun main ()
  (start :wait t))
