(require 'asdf)

(asdf:initialize-source-registry
  `(:source-registry
     (:tree
       ,(uiop/os:getcwd))
     :inherit-configuration))

(load (asdf:system-relative-pathname "parenscript-canvas" ".qlenv/quicklisp/setup.lisp"))

(ql:quickload :parenscript-canvas)

(parenscript-canvas.core:main)
