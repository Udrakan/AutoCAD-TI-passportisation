(defun C:pvksoupata ( / vmnozina i vlbod barva)
  (sssetfirst nil (setq vmnozina (ssget "x" (list (cons 0 "*INSERT")(cons 2 "uzav*,soupe*")))))
  (if (/= vmnozina nil)(progn
    (setq delkam (sslength vmnozina))
    (setq i 0)
       (while (< i delkam)
	(progn
	(setq vlbod(cdr (assoc 10 (entget (ssname vmnozina i))))) ;vkladaci bod bloku
	(setq barva(cdr (assoc 62 (entget (ssname vmnozina i))))) ;barva bloku
	  (cond
	    	((= barva 96)	(entmake (list '(0 . "CIRCLE") '(8 . "S_PVK_vodovod") 		'(62 . 3) (cons 10 vlbod) '(40 . 0.3))))
		((= barva 1)	(entmake (list '(0 . "CIRCLE") '(8 . "S_PVK_vodovod_vyrazeno") 	'(62 . 2) (cons 10 vlbod) '(40 . 0.3))))
	   )
	(entdel (ssname vmnozina i))
	(setq i(1+ i))
	))))
  )