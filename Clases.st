Object subclass: #AlgoTek
	instanceVariableNames: 'lista_artistas lista_ubicaciones'
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!AlgoTek methodsFor: 'as yet unclassified' stamp: 'Fernando 10/14/2023 01:02'!
paraEvento: nombre_evento_ingresado registrarUbicacionPlateaPreferencial: nombre_ubicacion_ingresada tarifa: tarifa_ingresada
	|objeto_platea|
	objeto_platea := PlateaPreferencial new.
	objeto_platea ingresarNombreEvento: nombre_evento_ingresado.
	objeto_platea ingresarNombreUbicacion: nombre_ubicacion_ingresada.
	objeto_platea ingresarTarifaUbicacion: tarifa_ingresada.
	lista_ubicaciones add: objeto_platea.! !

!AlgoTek methodsFor: 'as yet unclassified' stamp: 'Fernando 10/20/2023 22:45'!
costoEntradaPara: nombre_evento_ingresado enUbicacion: nombre_ubicacion_ingresada pagandoCon: pago_ingresado
	|objeto_artista objeto_ubicacion costo_artista costo_ubicacion resultado |
	objeto_artista := lista_artistas detect: [ :artista | artista getEventoArtista = nombre_evento_ingresado ].
	"Aclaracion: Asumo que no va dar nil"
	costo_artista := objeto_artista costoArtista.
	objeto_ubicacion := lista_ubicaciones detect: [ :ubicacion | ubicacion obtenerNombreUbicacion = nombre_ubicacion_ingresada  ].
	costo_ubicacion := objeto_ubicacion calcularCosto.
	resultado := costo_artista + costo_ubicacion.
	resultado := pago_ingresado aplicarDescuentoAImporte: resultado.
	^resultado 
	! !

!AlgoTek methodsFor: 'as yet unclassified' stamp: 'Fernando 10/10/2023 03:55'!
ingresarArtista: artista_ingresado
	lista_artistas add: artista_ingresado.! !

!AlgoTek methodsFor: 'as yet unclassified' stamp: 'Fernando 10/14/2023 01:10'!
paraEvento: nombre_evento_ingresado registrarUbicacionViP: nombre_ubicacion_ingresada tarifa: tarifa_ingresada lugaresDisponibles: cantidad_ingresados
	|objeto_vip|
	objeto_vip := Vip new.
	objeto_vip ingresarNombreEvento: nombre_evento_ingresado.
	objeto_vip ingresarNombreUbicacion: nombre_ubicacion_ingresada.
	objeto_vip ingresarTarifaUbicacion: tarifa_ingresada.
	objeto_vip ingresarCantidadLugaresDisponibles: cantidad_ingresados.
	lista_ubicaciones add: objeto_vip.! !

!AlgoTek methodsFor: 'as yet unclassified' stamp: 'Fernando 10/14/2023 01:07'!
paraEvento: nombre_ingresado registrarUbicacionCampo: nombre_ubicacion_ingresada tarifa: tarifa_ingresada
	|objeto_campo|
	objeto_campo := Campo new.
	objeto_campo ingresarNombreEvento: nombre_ingresado.
	objeto_campo ingresarNombreUbicacion: nombre_ubicacion_ingresada.
	objeto_campo ingresarTarifaUbicacion: tarifa_ingresada.
	lista_ubicaciones add: objeto_campo.! !

!AlgoTek methodsFor: 'as yet unclassified' stamp: 'Fernando 10/20/2023 22:33'!
entradaMasBarataPara: nombre_evento_ingresado pagandoCon: pago_ingresado
	|resultado resultado_ubicacion objeto_artista costo_artista| 
	objeto_artista := lista_artistas detect: [ :artista | artista getEventoArtista = nombre_evento_ingresado ] ifNone: [ nil ].
	resultado_ubicacion := (lista_ubicaciones at: 1) calcularCosto.
	lista_ubicaciones do: [ :ubicacion | (ubicacion calcularCosto < resultado_ubicacion) ifTrue: [resultado_ubicacion := ubicacion calcularCosto ]].
	"Me pide que use min pero ya lo use y NO ME FUNCIONO!!!!!!!!!!"
	costo_artista := objeto_artista costoArtista.
	resultado := costo_artista + resultado_ubicacion.
	"Cero porque para efectivo no hay descuento"
	resultado := pago_ingresado aplicarDescuentoAImporte: resultado.
	^resultado
	! !


!AlgoTek methodsFor: 'initialization' stamp: 'Fernando 10/18/2023 19:43'!
initialize 
	lista_artistas := OrderedCollection new.
	lista_ubicaciones := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

AlgoTek class
	instanceVariableNames: ''!

!AlgoTek class methodsFor: 'as yet unclassified' stamp: 'Fernando 10/20/2023 13:29'!
registrarEvento: nombre_evento deArtistaInternacional: nombre_artista_ingresado conTarifaArtista: tarifa_ingresada
	|objeto_artista_internacional  objeto_algotek|
	objeto_artista_internacional := ArtistaInternacional new.
	objeto_artista_internacional establecerNombreArtista: nombre_artista_ingresado.
	objeto_artista_internacional establecerTarifaArtista: tarifa_ingresada.
	objeto_artista_internacional establecerEventoArtista: nombre_evento.
	objeto_algotek := AlgoTek new.
	objeto_algotek ingresarArtista: objeto_artista_internacional.
	^objeto_algotek ! !

!AlgoTek class methodsFor: 'as yet unclassified' stamp: 'Fernando 10/18/2023 19:55'!
registrarEvento: nombre_evento deArtistaNacional: nombre_artista_nacional_ingresado conTarifaArtista: tarifa_ingresada
	|objeto_artista_nacional objeto_algotek|
	objeto_artista_nacional := ArtistaNacional new.
	objeto_artista_nacional establecerNombreArtista: nombre_artista_nacional_ingresado.
	objeto_artista_nacional establecerTarifaArtista: tarifa_ingresada.
	objeto_artista_nacional establecerEventoArtista: nombre_evento.
	objeto_algotek := AlgoTek new.
	objeto_algotek ingresarArtista: objeto_artista_nacional.
	^objeto_algotek ! !


Object subclass: #Artista
	instanceVariableNames: 'nombre_artista tarifa_artista evento_artista'
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!Artista methodsFor: 'as yet unclassified' stamp: 'Fernando 10/16/2023 21:59'!
getEventoArtista
	^evento_artista 
	! !

!Artista methodsFor: 'as yet unclassified' stamp: 'Fernando 10/16/2023 22:15'!
getTarifaArtista
	^tarifa_artista ! !

!Artista methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 20:49'!
establecerTarifaArtista: tarifa_ingresada
	(tarifa_ingresada < 0) ifTrue: [ ArtistaIngresaSuTarifaEnNegativoError signal ].
	tarifa_artista := tarifa_ingresada.! !

!Artista methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 21:30'!
establecerEventoArtista: nombre_evento_ingresado
	(nombre_evento_ingresado = ' ') ifTrue: [ ArtistaIngresaNombreEnVacioError signal ].
	evento_artista := nombre_evento_ingresado.! !

!Artista methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 21:30'!
establecerNombreArtista: nombre_ingresado
	(nombre_ingresado = ' ') ifTrue: [ ArtistaIngresaNombreEnVacioError signal ].
	nombre_artista := nombre_ingresado.! !

!Artista methodsFor: 'as yet unclassified' stamp: 'Fernando 10/16/2023 22:20'!
costoArtista	
"Corresponde que el calculo del costo lo hagan las clases hijas de la clase Artista? De alguna manera, hay que justificar la creacion de las clases hijas"
	self subclassResponsibility ! !

!Artista methodsFor: 'as yet unclassified' stamp: 'Fernando 10/16/2023 21:59'!
getNombreArtista 
	^nombre_artista ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Artista class
	instanceVariableNames: ''!

!Artista class methodsFor: 'as yet unclassified' stamp: 'Fernando 10/14/2023 19:50'!
ingresarNombre: nombre_ingresado eIngresarTarifa: tarifa_ingresada eIngresarEvento: nombre_evento_ingresado
	|objeto_artista|
	objeto_artista := Artista new.
	objeto_artista establecerNombreArtista: nombre_ingresado.
	objeto_artista establecerTarifaArtista: tarifa_ingresada.
	objeto_artista establecerEventoArtista: nombre_evento_ingresado.! !


Error subclass: #ArtistaIngresaNombreEnVacioError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

Error subclass: #ArtistaIngresaSuTarifaEnNegativoError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

Artista subclass: #ArtistaInternacional
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!ArtistaInternacional methodsFor: 'as yet unclassified' stamp: 'Fernando 10/16/2023 22:50'!
costoArtista 
	|resultado auxiliar_tarifa|
	auxiliar_tarifa := self getTarifaArtista.
	resultado := (auxiliar_tarifa * 2) / 5 + 1000.
	^resultado  ! !


Artista subclass: #ArtistaNacional
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!ArtistaNacional methodsFor: 'as yet unclassified' stamp: 'Fernando 10/16/2023 22:52'!
costoArtista 
	^ (self getTarifaArtista) log! !


Error subclass: #EfectivoIngresaElImporteEnValorNegativoError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

Error subclass: #TarjetaIngresaSuNombreEnVacioError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

Error subclass: #TarjetaIngresaUnImporteNegativoError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

Object subclass: #TipoDePago
	instanceVariableNames: 'descuento'
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!TipoDePago methodsFor: 'as yet unclassified' stamp: 'Fernando 10/20/2023 22:02'!
aplicarDescuentoAImporte: importe_ingresado
	self subclassResponsibility ! !


TipoDePago subclass: #Efectivo
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!Efectivo methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 20:35'!
aplicarDescuentoAImporte: importe_ingresado
	"Para pagos en efectivo, no hay descuento"
	(importe_ingresado < 0) ifTrue: [ EfectivoIngresaElImporteEnValorNegativoError signal].
	^importe_ingresado ! !


TipoDePago subclass: #Tarjeta
	instanceVariableNames: 'nombre_tarjeta'
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!Tarjeta methodsFor: 'as yet unclassified' stamp: 'Fernando 10/20/2023 22:16'!
calcularDescuento: importe_ingresado
	|resultado_descuento|
	resultado_descuento := (20*importe_ingresado)/100.
	^resultado_descuento.! !

!Tarjeta methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 12:35'!
obtenerNombreTarjeta
	^nombre_tarjeta ! !

!Tarjeta methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 20:40'!
ingresarNombreTarjeta: nombre_ingresado
	(nombre_ingresado = ' ') ifTrue: [ TarjetaIngresaSuNombreEnVacioError signal ].
	nombre_tarjeta := nombre_ingresado ! !

!Tarjeta methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 20:38'!
aplicarDescuentoAImporte: importe_ingresado
	"Para pagos en tarjeta, hay un 20% de descuento"
	|resultado_descuento auxiliar_importe|
	(importe_ingresado < 0) ifTrue: [ TarjetaIngresaUnImporteNegativoError signal ].
	resultado_descuento := self calcularDescuento: importe_ingresado.
	auxiliar_importe := importe_ingresado - resultado_descuento.
	^auxiliar_importe! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Tarjeta class
	instanceVariableNames: ''!

!Tarjeta class methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 00:41'!
conNombre: nombre_ingresado
	|objeto_tarjeta|
	objeto_tarjeta := Tarjeta new.
	objeto_tarjeta ingresarNombreTarjeta: nombre_ingresado.
	^objeto_tarjeta
	! !


Object subclass: #Ubicacion
	instanceVariableNames: 'nombre_ubicacion tarifa_ubicacion nombre_evento'
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!Ubicacion methodsFor: 'as yet unclassified' stamp: 'Fernando 10/14/2023 00:41'!
obtenerNombreEvento
	^nombre_evento ! !

!Ubicacion methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 21:15'!
ingresarNombreEvento: nombre_ingresado
	(nombre_ingresado = ' ') ifTrue: [ UbicacionIngresaNombreVacioError signal ].
	nombre_evento := nombre_ingresado.! !

!Ubicacion methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 21:15'!
ingresarNombreUbicacion: nombre_ubicacion_ingresada
	(nombre_ubicacion_ingresada = ' ') ifTrue: [ UbicacionIngresaNombreVacioError signal ].
	nombre_ubicacion := nombre_ubicacion_ingresada. 
	! !

!Ubicacion methodsFor: 'as yet unclassified' stamp: 'Fernando 10/13/2023 19:48'!
calcularCosto
	self subclassResponsibility.! !

!Ubicacion methodsFor: 'as yet unclassified' stamp: 'Fernando 10/13/2023 20:39'!
obtenerNombreUbicacion
	^nombre_ubicacion ! !

!Ubicacion methodsFor: 'as yet unclassified' stamp: 'Fernando 10/14/2023 00:03'!
obtenerTarifaUbicacion
	^tarifa_ubicacion ! !

!Ubicacion methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 20:29'!
ingresarTarifaUbicacion: tarifa_ingresada
	(tarifa_ingresada < 0) ifTrue: [ UbicacionIngresaTarifaUbicacionUnNumeroNegativoError signal ].
	tarifa_ubicacion := tarifa_ingresada.
	! !


Ubicacion subclass: #Campo
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!Campo methodsFor: 'as yet unclassified' stamp: 'Fernando 10/14/2023 00:20'!
calcularCosto 
	^ self obtenerTarifaUbicacion  ! !


Ubicacion subclass: #PlateaPreferencial
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!PlateaPreferencial methodsFor: 'as yet unclassified' stamp: 'Fernando 10/18/2023 04:03'!
calcularCosto 
	|ultimos_numeros auxiliar_nombre_ubicacion numeros|
	auxiliar_nombre_ubicacion := self obtenerNombreUbicacion.
	"Obtengo los dos ultimos caracteres de la cadena"
	ultimos_numeros := auxiliar_nombre_ubicacion copyFrom: auxiliar_nombre_ubicacion size - 1 to: auxiliar_nombre_ubicacion size.
	numeros := ultimos_numeros asInteger.
	^ numeros*(self obtenerTarifaUbicacion) ! !


Error subclass: #UbicacionIngresaNombreVacioError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

Error subclass: #UbicacionIngresaTarifaUbicacionUnNumeroNegativoError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

Ubicacion subclass: #Vip
	instanceVariableNames: 'cantidad_lugares_disponibles'
	classVariableNames: ''
	package: 'TP1-97538-Clases'!

!Vip methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 20:22'!
ingresarCantidadLugaresDisponibles: cantidad_ingresada
	(cantidad_ingresada < 0) ifTrue: [  VipIngresaCantidadNegativaDeLugaresDisponiblesError signal].
	cantidad_lugares_disponibles := cantidad_ingresada.! !

!Vip methodsFor: 'as yet unclassified' stamp: 'Fernando 10/12/2023 20:43'!
getCantidadLugaresDisponibles
	^cantidad_lugares_disponibles ! !

!Vip methodsFor: 'as yet unclassified' stamp: 'Fernando 10/21/2023 03:47'!
calcularCosto 
	|auxiliar_vip resultado|
	auxiliar_vip := self obtenerTarifaUbicacion.
	resultado := auxiliar_vip/cantidad_lugares_disponibles.
	cantidad_lugares_disponibles := cantidad_lugares_disponibles - 1.
	^resultado! !


Error subclass: #VipIngresaCantidadNegativaDeLugaresDisponiblesError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Clases'!
