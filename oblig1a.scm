;Exercise 1
;a)
;The first expression evaluates to (4 + 2) * 5 = 20
(* (+ 4 2 ) 5)

;b) 
;(* (+ 4 2 ) (5))
;will produce an error because 5 alone is not a procedure

;c)
;(* (4 + 2) 5) 
;will produce an error because scheme uses infix notation.

;d)
(define bar (/ 44 2))
;Defines a procedure "bar" that evaluates to 44/2 = 22

;e)
(- bar 11)
;Computes bar - 11 = 22 - 11 = 11

;f)
(/ (* bar 3 4 1) bar)
;Computes (bar*3*4*1)/bar = 12

;Exercise 2
;a)
(or (= 1 2)
	"paff!"
	"piff!"
	(zero? (1 - 1)))
; "or" will check the truth of every following statement in left to right order
;and takes the value of the first that is true.
; since all strings are evaluated as true in Scheme, it will print "paff!"


(and (= 1 2)
	"paff!"
	"piff!"
	(zero? (1 - 1)))
;"and" checks the truth value of every following statement in left to right order.
; If any are false "and" is evaluated to false, which means the console will print "#f"
;as this is the only false value in Scheme.

(if (positive? 42)
	"poff!"
	(i-am-undefined))

;it evaluates to "poff!" because it evaluates the "(positive? 42)"
;procedure to true. (i-am-undefined) would only be evaluated if 
;the predicate was false, so it doesn't affect the program that 
;the procedure is not defined. 
;This is an example of what makes special forms 
;different from procedures; in a procedure every input has to be evaluated, 
;not so for "if" or "and" which can terminate without evaluating every input.

;b)
;Defining (sign x) using if statements:

(define (sign x)
	(if (positive? x)
		1
		(if (negative? x)
			-1
			0)))

;Now defining (sign x) using cond:

(define (sign x)
	(cond ((< x 0) -1)
		  ((> x 0) 1)
		  ((= x 0) 0)))

;c)

; I don't think that it is in general possible to replace "cond" and "if" with 
; "and" and "or" for the following reason: "and" and "or"
; can be used to combine different types of conditions to make more complicated 
; conditions, but they cannot decide between options by themselves. Therefore
; I cannot instruct the computer to print 1 to the console, even if I decide 
; that a particular input is (for instance) positive.

;Exercise 3
;a)

(define (add1 x)
	(+ x 1))

(define (sub1 x)
	(- x 1))

;b)

(define (plus x y)
	(if (zero? y)
		x
		(plus (add1 x) (sub1 y))
		))

;c)
; The procedure above is recursive because the 
; procedure reuses the entirety of itself.
; An iterative procedure would be a procedure where 
; only part of the code is repeated.

;I have tried thinking about how to solve the problem using iteration, 
;But I am struggling a bit with how to do a for loop in Scheme. 
;I could try to make a procedure that essentially accomplishes the same as a for loop
;using recursion, but this code would essentially work the same way as before.

;d)

;Below you can see the code put in block structure. However, 
; I have not simplified the code in any meaningsful way
; because I find lexical scoping to be a bit confusing at the moment
; and I am running out of time!

(define (power-close-to b n)
	(define (power-iter b n e)
		(if (> (expt b e) n)
			e
			(power-iter b n (+ 1 e))
			)
	)
	(power-iter b n 1)
)

(power-close-to 2 8)








