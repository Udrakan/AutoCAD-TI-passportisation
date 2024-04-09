;metody pro upravu objektu
(defun NastavDleHlad (vmnozina dohladiny / i delkam objekt)
(setq i 0)
(setq delkam (sslength vmnozina)) ;pocet prvku vyberu
  (while (< i delkam)
  (setq objekt (vlax-ename->vla-object (ssname vmnozina i)))
		(vlax-put-property objekt 'layer dohladiny)
		(vlax-put-property objekt 'linetype "ByLayer")
	        (vlax-put-property objekt 'lineweight "-1")
	        (vlax-put-property objekt 'color acbylayer)
    		(setq i(1+ i))
    		(vla-update objekt)
          )
  	)