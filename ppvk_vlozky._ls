;Vlozky
(defun c:pvkvlozky ( / *error*  cme c_blks ss b_name b_lst );funkce pro vybrani vlozek a kruhu na rozbiti
   (defun *error* ( msg )
    (if cme (setvar 'cmdecho cme))
    (if (and c_doc (= 8 (logand 8 (getvar 'UNDOCTL)))) (vla-endundomark c_doc))
    (if (not (wcmatch (strcase msg) "*BREAK*,*CANCEL*,*EXIT*")) (princ (strcat "\nAn Error : " msg " occurred.")))
    (princ)
  );_end_*error*_defun
	
  (setq c_doc (vla-get-activedocument (vlax-get-acad-object))
		c_blks (vla-get-blocks c_doc)
  );_end_setq

  (cond ( (/= (getvar 'cmdecho) 0) (setq cme (getvar 'cmdecho)) (setvar 'cmdecho 0)))
  
  (if (and c_doc (= 8 (logand 8 (getvar 'UNDOCTL)))) (vla-endundomark c_doc))
  (vla-startundomark c_doc)

  (setq ss (ssget "x" (list (cons 2 "VLOZKA*,UZAVER*,KOHOUT*"))))
  
  (vlax-for blk (vla-get-activeselectionset c_doc)
    (setq b_name (vlax-get-property blk (if (vlax-property-available-p blk 'effectivename) 'effectivename 'name)))
    (cond ( (not (vl-position b_name b_lst))
            (vlax-for obj (vla-item c_blks b_name)
              (if (not (= (vlax-get-property obj 'layer) "0")) (vlax-put-property obj 'layer "0"))
		(vlax-put-property obj 'linetype "Continuous")
	      	(vlax-put-property obj 'lineweight "-1")
	      	(vlax-put-property obj 'color acbylayer)
            );end_for
            (setq b_lst (cons b_name b_lst))
          )
    );end_cond
    (vla-update blk)        
  );end_for
  
  (vla-regen c_doc acAllViewports)
  (if (and c_doc (= 8 (logand 8 (getvar 'UNDOCTL)))) (vla-endundomark c_doc))
  (if cme (setvar 'cmdecho cme))
  (sssetfirst nil (setq ss (ssget "x" (list (cons 2 "VLOZKA*,UZAVER*,KOHOUT*")))))
  ;CISTI VSE, ZMEN MERITKO CARY A REGENERUJ VYKRES
  (command "_.purge" "_all" "*" "_no" "ltscale" "0.05" "regen")
  (princ)
);_end_defun
;KONEC vlozky