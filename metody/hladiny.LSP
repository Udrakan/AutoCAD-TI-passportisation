;metody pro praci s hladinami
(setq acadobject (vlax-get-Acad-Object))
(setq activedocument (vla-get-activedocument acadobject))
(setq Hladiny (vla-get-layers activedocument))
;(command "_-linetype" "N" "*" "acadiso2.lin" "")

;funkce pro vytvoreni nove hladiny
(defun NovaHlad (nazevhl barvahl typchl / Hladiny hladina )
  (setq Hladiny (vla-get-layers activedocument))
  (setq hladina (vla-add Hladiny nazevhl))
  (vla-put-color hladina barvahl)
  (vla-put-linetype hladina typchl)
  )

;funkce pro nastaveni vlastnosti hladiny
(defun NastavHlad (nastavenihl / i Hladiny hladina nazevhl)

  (setq Hladiny (vla-get-layers activedocument))
 (setq i 0)
 (while (< i (length nastavenihl))
 (if (/= nil (tblsearch "LAYER" (cddr (nth i nastavenihl))))(progn
  (setq hladina (vla-item Hladiny (cddr (nth i nastavenihl))))					       
  (vla-put-color hladina (car(nth i nastavenihl)))
  (vla-put-linetype hladina (cadr(nth i nastavenihl))))
  )
 (setq i (1+ i))
 )
)

;funkce pro slouceni pole hladin do jedne
(defun SlucHlad (listhl cilhl / hladina )
  (setq Hladiny (vla-get-layers activedocument))
  (foreach hladina listhl
    (progn
	(command ".-laymrg" "_N" hladina "" "_N" cilhl)
	(while (> (getvar 'CMDACTIVE) 0) (command "_y"))))
  )
;(Sluchlad '("prvni" "druha" "treti")"ctvrta")

;funkce pro prevedeni seznamu objektu do pole hladin
(defun PrevedHlad (vymena / i filtr)
	(setq i 0)
	(while (< i (length vymena))
	(setq filtr (ssget "x" (list 		(cons 8 (car (nth i vymena)))
						(cons 62(cadr (nth i vymena)))
						(cons 6 (caddr (nth i vymena)))
						)))
	(if	(/= filtr nil)
  		(progn	(Novahlad (cdddr(nth i vymena)) 6 "Continuous")
			(NastavDleHlad filtr (cdddr(nth i vymena))));zkus sloucit
	)
	(setq i (1+ i)))
)
;(car (nth 0 vymena)) hladina
;(cadr (nth 0 vymena)) barva
;(caddr (nth 0 vymena)) cara
;(cdddr(nth 0 vymena)) nova hladina
;(sssetfirst nil (setq fff (ssget "x" (list (cons 8 "20")(cons 62 44)(cons 6 "DGN3")))))