;; 10. Define a function that replaces one node with another one in a n-tree 
;; represented as: (root list_of_nodes_subtree1... list_of_nodes_subtreen)

;;Eg: tree is (a (b (c)) (d) (e (f))) and node 'b' will be replace with node 'g' => 
;;       tree (a (g (c)) (d) (e (f)))

(defun replace_node(n old new)
    (cond
        ((equal n old) new)
        ((equal n new) old)
        ((atom n) n)
        (t (mapcar 
                    #'(lambda (l)
                        (replace_node l old new)
                       ) 
                    n)
            )
    )
)


(format t "~C replace_node([A (B (C)) (D) (E (F))], B, G) = ~d. " #\linefeed (replace_node '(A (B (C)) (D) (E (F))) 'B 'G))
(format t "~C replace_node([A (B (C)) (D) (E (G))], B, G) = ~d. " #\linefeed (replace_node '(A (B (C)) (D) (E (G))) 'B 'G))
            
(format t "~C replace_node([A], A, B) = ~d. " #\linefeed (replace_node '(A) 'A 'B))
(format t "~C replace_node([], A, B) = ~d. " #\linefeed (replace_node '() 'A 'B))