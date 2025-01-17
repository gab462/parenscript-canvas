(in-package :cl-user)
(defpackage parenscript-canvas-asd
  (:use :cl :asdf))
(in-package :parenscript-canvas-asd)

(defsystem parenscript-canvas
  :license "MIT"
  :depends-on ("spinneret"
               "parenscript"
               "lass"
               "clack")
  :serial t
  :pathname "src"
  :components ((:file "core")))
