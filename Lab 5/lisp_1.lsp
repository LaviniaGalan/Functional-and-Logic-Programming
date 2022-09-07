; a) Write a function to return the product of all the numerical atoms from a list,
;at superficial level.

;product(l: the list) - computes the product of the elements of l, at a superficial level.
(defun product(l)
    (cond
        ((null l) 1)
        ((numberp (car l)) (* (car l) (product (cdr l))))
        (t (product (cdr l)))
    )
)

(setq result (product '(2 3 (5 7) A 10 V 1 (9 5))))
(format t " ~C a) ~C product([2 3 [5 7] A 10 V 1 [9 5 3]]) = ~d. " #\linefeed #\linefeed result)

(setq result (product '()))
(format t "~C product([]) = ~d. " #\linefeed result)

(setq result (product '((3 6 7))))
(format t "~C product([[3 6 7]]) = ~d. " #\linefeed result)


; b) Write a function to replace the first occurence of an element E 
;in a given list with an other element O.

;replace(l: the list, e: the element to be replaced, o: the new element) - replaces the first 
;occurence of e in the list l with o

(defun replace_elem(l e o)
    (cond
        ((null l) ())
        ((equal (car l) e) (cons o (cdr l)))
        (t (cons (car l) (replace_elem (cdr l) e o)))
    )
)

(setq result (replace_elem '(2 A 3 (4 5) B A 10 (A 3)) 'A 'ABC))
(format t "~C ~C b) ~C replace_elem([2 A 3 [4 5] B A 10 [A 3]], A, ABC) = ~a. " #\linefeed #\linefeed #\linefeed result)

(setq result (replace_elem '(4 5 (4 5) B A C (4 5) 6) '(4 5) 'ABC))
(format t "~C replace_elem([4 5 [4 5] B A C [4 5] 6], [4 5], ABC) = ~a. " #\linefeed result)

(setq result (replace_elem '(1 2 3 A (5 6) 7) 10 'ABC ))
(format t "~C replace_elem([1 2 3 A [5 6] 7], 10, ABC) = ~a. " #\linefeed result)

(setq result (replace_elem '() 10 'ABC ))
(format t "~C replace_elem([], 10, ABC) = ~a. " #\linefeed result)


; c) Write a function to compute the result of an arithmetic expression memorised
;in preorder on a stack. Examples:
; (+ 1 3) ==> 4 (1 + 3)
; (+ * 2 4 3) ==> 11 ((2 * 4) + 3)
; (+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 - (2 * 2))

;make_operation(op: the operator, n1, n2: the operands) - returns the result of the operation
;n1 "op" n2
(defun make_operation(op n1 n2)
    (cond 
        ((equal op '+) (+ n1 n2))
        ((equal op '-) (- n1 n2))
        ((equal op '*) (* n1 n2))
        ((equal op '/) (/ n1 n2))
    )
)

;compute_one(l: the list) - reduce the list l by "solving" all 
;the (operator operand operand) sequence and replace it with the result of the operation
(defun compute_one(l)
    (cond 
        ((null l) ())
        ((and (and (numberp (cadr l)) (numberp (caddr l))) (and (atom (car l)) (not(numberp (car l))))) 
          (cons (make_operation (car l) (cadr l) (caddr l)) (compute_one(cdddr l))))
        
        (t (cons (car l) (compute_one (cdr l))))
    )
)

;compute_all(l: the list) - computes the final result of the arithmetic expression memorised in
;preorder in the list l
(defun compute_all(l)+
    (cond
        ((null (cdr l)) (car l))
        (t (compute_all(compute_one l)))
    )
)

(setq result (compute_all '(+ 1 3)))
(format t "~C ~C c) ~C compute_all(+ 1 3) = ~d. " #\linefeed #\linefeed #\linefeed result)

(setq result (compute_all '(+ * 2 4 3)))
(format t "~C compute_all(+ * 2 4 3) = ~d. " #\linefeed result)

(setq result (compute_all '(+ * 2 4 - 5 * 2 2)))
(format t "~C compute_all(+ * 2 4 - 5 * 2 2) = ~d. " #\linefeed result)

(setq result (compute_all '()))
(format t "~C compute_all() = ~d. " #\linefeed result)

; d) Write a function to produce the list of pairs (atom n), where atom appears
;for n times in the parameter list. Example:
; (A B A B A C A) --> ((A 4) (B 2) (C 1)) 

;count_app(l: the list, e: the element) - counts the number of occurences of e in the list l
(defun count_app(l e)
    (cond
        ((null l) 0)
        ((equal (car l) e) (+ 1 (count_app (cdr l) e)))
        ((listp (car l)) (+ (count_app (car l) e) (count_app (cdr l) e)))
        (t (count_app (cdr l) e))
    )
)

;remove_elem(l: the list, e: the element) - removes all the occurences of e from the list l
(defun remove_elem(l e)
    (cond
        ((null l) ())
        ((equal (car l) e) (remove_elem (cdr l) e))
        ((listp (car l)) (append (remove_elem (car l) e) (remove_elem (cdr l) e)))
        (t (cons (car l)(remove_elem (cdr l) e)))
    )
)

;main(l: the list) - produces a list of pairs (atom - number of occurences of the atom in l)
(defun main(l)
    (cond   
        ((null l) ())
        (t (cons (list (car l) (count_app l (car l))) (main (remove_elem l (car l)))))
    )
)


(setq result (main '(A B A B A C A)))
(format t "~C ~C d) ~C main([A B A B A C A]) = ~a. " #\linefeed #\linefeed #\linefeed result)

(setq result (main '(A B (A B A) C A)))
(format t "~C main([A B [A B A] C A]) = ~a. " #\linefeed result)

(setq result (main '()))
(format t "~C main([], 10, ABC) = ~a. " #\linefeed result)