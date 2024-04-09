;program pro upravu podkladu PVK
(vl-load-com)
(defun c:pvkc (/ i vymenahl filtr)
(load "bloky" "\bloky not loaded")
(load "hladiny" "\nLispfile2 not loaded")
(load "modifikujobj" "\nLispfile3 not loaded")
(setq acadobject (vlax-get-Acad-Object))
(setq activedocument (vla-get-activedocument acadobject))
(setq Hladiny (vla-get-layers activedocument))

;POZN¡MKA
  ;zde jsi skoncil. Standardizuj ukladani car

;(command "_-linetype" "N" "*" "acadiso2.lin" "")
 (command "_-linetype" "N" "*KANALIZACE*,*VODOVOD*" "cary_pvk.lin" "")
 (command "_-linetype" "N" "*VODOVOD*" "cary_sitari.lin" "")
 ;(command "_-linetype" "N" "_VODOVOD_NADZ" "cary_pvk.lin" "")
  
;zmen hladiny objektu
  
(setq vymenahl '(
	("20" 44 "Continuous" . "S_PVK_kanalizace_jednotn·")
	("20" 44 "DGN3" . "S_PVK_kanalizace_jednotn·_nezamÏ¯eno")
	("49" 44 "DGN2" . "S_PVK_kanalizace_p¯Ìpojky")
	("49" 253 "DGN2" . "S_PVK_kanalizace_p¯Ìpojky")
	("49" 162 "DGN2" . "S_PVK_kanalizace_deöùov·_p¯Ìpojky")
	("49" 172 "DGN2" . "S_PVK_kanalizace_deöùov·_p¯Ìpojky")
	("20" 5 "Continuous" . "S_PVK_kanalizace_deöùovo")
	("20" 5 "DGN3" . "S_PVK_kanalizace_deöùov·_nezamÏ¯eno")
	("8" 92 "Continuous" . "S_PVK_vodovod")
	("8" 96 "Continuous" . "S_PVK_vodovod")
	("8" 12 "Continuous" . "S_PVK_vodovod_mimo provoz")
	("8" 96 "DGN2" . "S_PVK_vodovod_nezamÏ¯eno")
				)
	)
(PrevedHlad vymenahl)

;nastav vlastnosti hladin
(setq nastavenihl 	'(
	(30 "_KANALIZACE_JEDNOTNA_PODZ" . 	"S_PVK_kanalizace_jednotn·")
	(30 "_KANALIZACE_JEDNOTNA_NADZ" . 	"S_PVK_kanalizace_jednotn·_nezamÏ¯eno")
	(30 "_KANALIZACE_PODZ" 		. 	"S_PVK_kanalizace_p¯Ìpojky")
	(30 "_KANALIZACE_NADZ" 		. 	"S_PVK_kanalizace_p¯Ìpojky_nezamÏ¯eno")
	(5 "_KANALIZACE_JEDNOTNA_PODZ" 	. 	"S_PVK_kanalizace_deöùovo")
	(5 "_KANALIZACE_JEDNOTNA_NADZ" 	. 	"S_PVK_kanalizace_deöùov·_nezamÏ¯eno")
	(5 "_KANALIZACE_PODZ" 		. 	"S_PVK_kanalizace_deöùov·_p¯Ìpojky")
	(5 "_KANALIZACE_NADZ" 		. 	"S_PVK_kanalizace_deöùov·_p¯Ìpojky")
	(3 "_VODOVOD_PODZ" 		. 	"S_PVK_vodovod")
	(3 "_VODOVOD_NADZ" 		. 	"S_PVK_vodovod_nezamÏ¯eno")
	(2 "VODOVOD_ZRUSENY" 		. 	"S_PVK_vodovod_mimo provoz")
			)
)
(NastavHlad nastavenihl)
)

;importuj bloky




