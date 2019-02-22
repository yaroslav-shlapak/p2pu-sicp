
;; Recursive process
(define (f1 n)
  (cond ((< n 3) n)
	(else (+ (f1 (- n 1))
		 (* 2 (f1 (- n 2)))
		 (* 3 (f1 (- n 3)))))))

;; Test 
(f1 30)
;; takes 2 seconds

;; Iterative process
(define (f2 n)
  (define (iter a b c count) ; zeroth, first, second, counter
    (cond ((= count 0) a)
	  (else (iter b 
		      c 
		      (+ c (* 2 b) (* 3 a)) 
		      (- count 1)))))
  (iter 0 1 2 n))

;; (f2 2)
;; (iter 0 1 2 2) -> 4
;; (iter 1 2 4 1) -> 11
;; (iter 2 4 11 0) -> 2

;; The same, with slight change to avoid 2 unnecessary calculations of c
(define (f2 n)
  (define (iter a b c count) ; zeroth, first, second, counter
    (cond ((< count 0) n)
	  ((= count 0) c)
	  (else (iter b 
		      c 
		      (+ c (* 2 b) (* 3 a)) 
		      (- count 1)))))
  (iter 0 1 2 (- n 2)))

;; Tests
(f2 30)

(- (f1 20)
   (f2 20))

;; Evaluates instantly
(f2 200)

;; (f1 200) takes eternity
