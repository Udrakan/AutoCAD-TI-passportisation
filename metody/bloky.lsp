;predefinuj blok
(defun PredefBl (puvodnibl novybl / )
	(vl-cmdf "_insert" (strcat puvodnibl "=C:\\autocad_supportfiles\\bloky\\" novybl))
  	(command)
  )

;nacti blok
(defun NactiBl (novybl / )
 (vl-load-com)
 (vla-delete 	(vla-insertblock
		(vla-get-modelspace (vla-get-activedocument (vlax-get-acad-object))) ;do modelu
		(vlax-3D-point 0.0 0.0 0.0) ;do pocatku
    		(strcat "C:\\autocad_supportfiles\\bloky\\" novybl ".dwg") ;cesta
     		1.0 1.0 1.0 0.0 )) ;meritka xyz a natoceni
 (vla-Regen (vla-get-activedocument (vlax-get-acad-object)) acAllViewports) ;regeneruj vykres
)

;vloz blok na souradnice
(defun UmistiBl (novybl kam / )
  (vla-insertblock	(vla-get-modelspace (vla-get-activedocument (vlax-get-acad-object))) ;do modelu
			(vlax-3D-point kam)
			(strcat "C:\\autocad_supportfiles\\bloky\\" novybl ".dwg") ;cesta
    			1.0 1.0 1.0 0.0 ) ;meritka xyz a natoceni
)
;vlozi novy blok na pozici puvodniho
(defun VlozNaBl (starybl novybl / puvodnibl nhlad)
 (setq puvodnibl (vlax-ename->vla-object starybl))
 (setq nhlad (vlax-get-property puvodnibl 'Layer))
 (vla-put-layer
 (vla-insertblock	(vla-get-modelspace (vla-get-activedocument (vlax-get-acad-object))) ;do modelu
			(vlax-get-property puvodnibl 'InsertionPoint) ;vkladaci bod
			(strcat "C:\\autocad_supportfiles\\bloky\\" novybl ".dwg") ;novyblok
    			1.0 1.0 1.0 ;meritka xyz
    			(vlax-get-property puvodnibl 'Rotation))  ;natoceni
 (vlax-get-property puvodnibl 'Layer))
 )
;vymeni puvodni blok za novy
(defun VymenBl (starybl novybl / puvodnibl obj)
 (setq puvodnibl (setq obj (vlax-ename->vla-object starybl)))
 (vla-put-layer
 (vla-insertblock	(vla-get-modelspace (vla-get-activedocument (vlax-get-acad-object))) ;do modelu
			(vlax-get-property puvodnibl 'InsertionPoint) ;vkladaci bod
			(strcat "C:\\autocad_supportfiles\\bloky\\" novybl ".dwg") ;cesta
    			1.0 1.0 1.0 ;meritka xyz
    			(vlax-get-property puvodnibl 'Rotation))  ;natoceni
 (vlax-get-property puvodnibl 'Layer))
 (vla-delete obj)
 ;(vla-Regen (vla-get-activedocument (vlax-get-acad-object)) acAllViewports)
)

;vlozi seznam novych bloku na pozice puvodnich
(defun lVlozNaBl (sbl / i j starybl novybl sel)
  (setq i 0)
  (while (< i (length sbl))
  	(setq	starybl (car(nth i sbl))
	  	novybl (cdr(nth i sbl))
	)
	(if 	(tblsearch "BLOCK" novybl)	;pokud blok uz existuje na vykresu
	  	(PredefBl novybl novybl)	;predefinuj ho
	)
  	(setq sel (ssget "x" (list(cons 0 "INSERT")(cons 2 starybl))))
  	(setq j 0)
  	(while (< j (sslength sel))
	  (VlozNaBl (ssname sel j) novybl)
	  (setq j (1+ j))
	)
    (setq i (1+ i)))
 )

;vlozi seznam novych bloku na pozice puvodnich
(defun lVymenBl (sbl / i j starybl novybl sel)
  (setq i 0)
  (while (< i (length sbl))
  	(setq	starybl (car(nth i sbl))
	  	novybl (cdr(nth i sbl))
	)
	(if 	(tblsearch "BLOCK" novybl)	;pokud blok uz existuje na vykresu
	  	(PredefBl novybl novybl)	;predefinuj ho
	)
  	(setq sel (ssget "x" (list(cons 0 "INSERT")(cons 2 starybl))))
  	(setq j 0)
  	(while (< j (sslength sel))
	  (VymenBl (ssname sel j) novybl)
	  (setq j (1+ j))
	)
    (setq i (1+ i)))
 )