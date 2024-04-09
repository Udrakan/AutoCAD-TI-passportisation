;program pro upravu podkladu PVK
(vl-load-com)
(defun c:pvkc (/ i vymenahl filtr)
(setq acadobject (vlax-get-Acad-Object))
(setq activedocument (vla-get-activedocument acadobject))
(setq Hladiny (vla-get-layers activedocument))

;POZNÁMKA
  ;zde jsi skoncil. Standardizuj ukladani car

;(command "_-linetype" "N" "*" "acadiso2.lin" "")
 (command "_-linetype" "N" "*KANALIZACE*,*VODOVOD*" "cary_pvk.lin" "")
 (command "_-linetype" "N" "*VODOVOD*" "cary_sitari.lin" "")
 ;(command "_-linetype" "N" "_VODOVOD_NADZ" "cary_pvk.lin" "")
  
;zmen hladiny objektu
  
(setq vymenahl '(
	("20" 44 "Continuous" . "S_PVK_kanalizace_jednotná")
	("20" 44 "DGN3" . "S_PVK_kanalizace_jednotná_nezamìøeno")
	("49" 44 "DGN2" . "S_PVK_kanalizace_pøípojky")
	("49" 253 "DGN2" . "S_PVK_kanalizace_pøípojky")
	("49" 162 "DGN2" . "S_PVK_kanalizace_dešová_pøípojky")
	("49" 172 "DGN2" . "S_PVK_kanalizace_dešová_pøípojky")
	("20" 5 "Continuous" . "S_PVK_kanalizace_dešovo")
	("20" 5 "DGN3" . "S_PVK_kanalizace_dešová_nezamìøeno")
	("8" 92 "Continuous" . "S_PVK_vodovod")
	("8" 96 "Continuous" . "S_PVK_vodovod")
	("8" 12 "Continuous" . "S_PVK_vodovod_mimo provoz")
	("8" 96 "DGN2" . "S_PVK_vodovod_nezamìøeno")
				)
	)
(PrevedHlad vymenahl)

;nastav vlastnosti hladin
(setq nastavenihl 	'(
	(30 "_KANALIZACE_JEDNOTNA_PODZ" . 	"S_PVK_kanalizace_jednotná")
	(30 "_KANALIZACE_JEDNOTNA_NADZ" . 	"S_PVK_kanalizace_jednotná_nezamìøeno")
	(30 "_KANALIZACE_PODZ" 		. 	"S_PVK_kanalizace_pøípojky")
	(30 "_KANALIZACE_NADZ" 		. 	"S_PVK_kanalizace_pøípojky_nezamìøeno")
	(5 "_KANALIZACE_JEDNOTNA_PODZ" 	. 	"S_PVK_kanalizace_dešovo")
	(5 "_KANALIZACE_JEDNOTNA_NADZ" 	. 	"S_PVK_kanalizace_dešová_nezamìøeno")
	(5 "_KANALIZACE_PODZ" 		. 	"S_PVK_kanalizace_dešová_pøípojky")
	(5 "_KANALIZACE_NADZ" 		. 	"S_PVK_kanalizace_dešová_pøípojky")
	(3 "_VODOVOD_PODZ" 		. 	"S_PVK_vodovod")
	(3 "_VODOVOD_NADZ" 		. 	"S_PVK_vodovod_nezamìøeno")
	(2 "VODOVOD_ZRUSENY" 		. 	"S_PVK_vodovod_mimo provoz")
			)
)
(NastavHlad nastavenihl)
)



