(fn consume [f]
  (let [f (macroexpand f)]
    (if (sym? f)
      `(let [a# ,f]
         (set ,f nil)
         a#)
       (error "argument was not an identifier"))))

(fn toggle [v]
  (let [v (macroexpand v)]
    (if (sym? v)
      `(set ,v (not ,v))
     (error "argument was not an identifier"))))

(fn set-if-nil [x y]
  (let [x (macroexpand x)]
    (if (sym? x)
      `(when (= nil ,x) (set ,x ,y) ,x)
     (error "argument was not an identifier"))))

{: consume
 : toggle
 : set-if-nil}
