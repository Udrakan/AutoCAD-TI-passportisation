;program pro upravu podkladu PVK
(vl-load-com)
(defun c:pvkc (/ i vymenahl filtr)
(load "bloky" "\bloky not loaded")
(load "hladiny" "\nLispfile2 not loaded")
(load "modifikujobj" "\nLispfile3 not loaded")
(setq acadobject (vlax-get-Acad-Object))
(setq activedocument (vla-get-activedocument acadobject))
(setq Hladiny (vla-get-layers activedocument))

;POZN�MKA
  ;zde jsi skoncil. Standardizuj ukladani car

;(command "_-linetype" "N" "*" "acadiso2.lin" "")
;;; (command "_-linetype" "N" "*KANALIZACE*,*VODOVOD*" "cary_pvk.lin" "")
;;; (command "_-linetype" "N" "*VODOVOD*" "cary_sitari.lin" "")
 ;(command "_-linetype" "N" "_VODOVOD_NADZ" "cary_pvk.lin" "")
  
;zmen hladiny objektu
  
(setq vymenahl '(
	("Kabel PKO" 7 "Continuous" . "S_PPD_Kabel PKO")
	("NT OP Chr�ni ka - provoz" 7 "S_NT OP Chr�ni�ka - provoz")
				)
	)
(PrevedHlad vymenahl)
;;;
;;;;nastav vlastnosti hladin
;;;(setq nastavenihl 	'(
;;;	(30 "_KANALIZACE_JEDNOTNA_PODZ" . 	"S_PVK_kanalizace_jednotn�")
;;;	(30 "_KANALIZACE_JEDNOTNA_NADZ" . 	"S_PVK_kanalizace_jednotn�_nezam��eno")
;;;	(30 "_KANALIZACE_PODZ" 		. 	"S_PVK_kanalizace_p��pojky")
;;;	(30 "_KANALIZACE_NADZ" 		. 	"S_PVK_kanalizace_p��pojky_nezam��eno")
;;;	(5 "_KANALIZACE_JEDNOTNA_PODZ" 	. 	"S_PVK_kanalizace_de��ovo")
;;;	(5 "_KANALIZACE_JEDNOTNA_NADZ" 	. 	"S_PVK_kanalizace_de��ov�_nezam��eno")
;;;	(5 "_KANALIZACE_PODZ" 		. 	"S_PVK_kanalizace_de��ov�_p��pojky")
;;;	(5 "_KANALIZACE_NADZ" 		. 	"S_PVK_kanalizace_de��ov�_p��pojky")
;;;	(3 "_VODOVOD_PODZ" 		. 	"S_PVK_vodovod")
;;;	(3 "_VODOVOD_NADZ" 		. 	"S_PVK_vodovod_nezam��eno")
;;;	(2 "VODOVOD_ZRUSENY" 		. 	"S_PVK_vodovod_mimo provoz")
;;;			)
;;;)
;;;(NastavHlad nastavenihl)
;;;)
;;;
;;;;importuj bloky
;;;
;;;
;;;
;;;
