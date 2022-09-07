;(A 2 B 0 C 2 D 0 E 0) (1)
;(A (B) (C (D) (E))) (2)

;4. Convert a tree of type (2) to type (1).

;for a given list of the form (root left_subtree right_subtree), returns the number of children of the root (how many subtrees are in the list)
(defun count_subtrees (l)
    (cond
        ((null l) 0)
        ((and (not (null (cadr l))) (not (null (caddr l)))) 2)
        ((or (not (null (cadr l))) (not (null (caddr l)))) 1)
        (t 0)
    )
)

;converts a tree of type (2) to the type (1).
(defun convert(l)
    (cond
        ((null l) ())
        (t (append (list (car l) (count_subtrees l)) (convert (cadr l)) (convert (caddr l))))
    )
)


(format t "~C convert([A [B] [C [D] [E]]]) = ~d. " #\linefeed (convert '(A (B) (C (D) (E)))))
(format t "~C convert([A [] [C [D] [E]]]) = ~d. " #\linefeed (convert '(A () (C (D) (E)))))
(format t "~C convert([A [B [] [F]] [D [E]]) = ~d. " #\linefeed (convert '(A (B () (F)) (D (E)))))
(format t "~C convert([A]) = ~d. " #\linefeed (convert '(A)))
(format t "~C convert([]) = ~d. " #\linefeed (convert '()))





