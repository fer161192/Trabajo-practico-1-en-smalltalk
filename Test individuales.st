Los test de cada una de las clases creadas

TestCase subclass: #AlgoTekTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Test individuales'!

!AlgoTekTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 18:16'!
test01ProbarElCostoDeUnaEntradaDeTipoCampoEnEfectivo
	|artista_nacional algotek resultado_costo efectivo|
	efectivo := Efectivo new.
	artista_nacional := ArtistaNacional new.
	artista_nacional establecerNombreArtista: 'Tan Bionica'.
	artista_nacional establecerEventoArtista: 'La Ultima Noche Magica En River'.
	artista_nacional establecerTarifaArtista: 50000.
	algotek := AlgoTek new.
	algotek ingresarArtista: artista_nacional.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionCampo: 'Campo General' tarifa: 16000.
	resultado_costo := algotek costoEntradaPara: 'La Ultima Noche Magica En River' enUbicacion: 'Campo General' pagandoCon: efectivo.
	self assert: resultado_costo equals: (50000 log + 16000).
	! !

!AlgoTekTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 18:56'!
test03ProbarSacarLaEntradaMasBarataParaUnArtistaConEfectivo
	|artista_nacional algotek resultado_costo efectivo resultado_esperado|
	efectivo := Efectivo new.
	artista_nacional := ArtistaNacional new.
	artista_nacional establecerNombreArtista: 'Tan Bionica'.
	artista_nacional establecerEventoArtista: 'La Ultima Noche Magica En River'.
	artista_nacional establecerTarifaArtista: 50000.
	algotek := AlgoTek new.
	algotek ingresarArtista: artista_nacional.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionPlateaPreferencial: 'M912' tarifa: 25000.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionPlateaPreferencial: 'D018' tarifa: 2000.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionCampo: 'Campo General' tarifa: 16000.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionViP: 'Hospitality' tarifa: 40000 lugaresDisponibles: 2.
	resultado_costo := algotek entradaMasBarataPara: 'La Ultima Noche Magica En River' pagandoCon: efectivo.
	resultado_esperado := 50000 log.
	resultado_esperado := resultado_esperado + 16000.
	self assert: resultado_costo closeTo: resultado_esperado precision: 0.0001.
	! !

!AlgoTekTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 19:01'!
test04ProbarSacarLaEntradaMasBarataParaUnArtistaConTarjeta
	|artista_nacional algotek resultado_costo tarjeta resultado_esperado|
	tarjeta := Tarjeta conNombre: 'Patagonia'.
	artista_nacional := ArtistaNacional new.
	artista_nacional establecerNombreArtista: 'Tan Bionica'.
	artista_nacional establecerEventoArtista: 'La Ultima Noche Magica En River'.
	artista_nacional establecerTarifaArtista: 50000.
	algotek := AlgoTek new.
	algotek ingresarArtista: artista_nacional.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionPlateaPreferencial: 'M912' tarifa: 25000.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionPlateaPreferencial: 'D018' tarifa: 2000.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionCampo: 'Campo General' tarifa: 16000.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionViP: 'Hospitality' tarifa: 40000 lugaresDisponibles: 2.
	resultado_costo := algotek entradaMasBarataPara: 'La Ultima Noche Magica En River' pagandoCon: tarjeta.
	resultado_esperado := 50000 log.
	resultado_esperado := resultado_esperado + 16000.
	resultado_esperado := resultado_esperado*0.8.
	self assert: resultado_costo closeTo:  resultado_esperado precision: 0.0001.! !

!AlgoTekTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 18:25'!
test02ProbarElCostoDeUnaEntradaDeTipoCampoEnTarjeta
	|artista_nacional algotek resultado_costo tarjeta|
	tarjeta := Tarjeta conNombre: 'Patagonia'.
	artista_nacional := ArtistaNacional new.
	artista_nacional establecerNombreArtista: 'Tan Bionica'.
	artista_nacional establecerEventoArtista: 'La Ultima Noche Magica En River'.
	artista_nacional establecerTarifaArtista: 50000.
	algotek := AlgoTek new.
	algotek ingresarArtista: artista_nacional.
	algotek paraEvento: 'La Ultima Noche Magica En River' registrarUbicacionCampo: 'Campo General' tarifa: 16000.
	resultado_costo := algotek costoEntradaPara: 'La Ultima Noche Magica En River' enUbicacion: 'Campo General' pagandoCon: tarjeta.
	self assert: resultado_costo closeTo: ((50000 log + 16000)*0.8) precision: 0.0001.
	! !


TestCase subclass: #ArtistaInternacionalTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Test individuales'!

!ArtistaInternacionalTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 16:28'!
test01ObtenerElCostoDeUnArtistaInternacional
	|artista_internacional|
	artista_internacional := ArtistaInternacional new.
	artista_internacional establecerNombreArtista: 'Taylor Swift'.
	artista_internacional establecerEventoArtista: 'The Eras Tour, en River'.
	artista_internacional establecerTarifaArtista: 100000.
	self assert: artista_internacional costoArtista equals:  ((100000 * 2) / 5 + 1000).! !


TestCase subclass: #ArtistaNacionalTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Test individuales'!

!ArtistaNacionalTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 15:48'!
test01ObtenerElCostoDeUnArtista
	|artista_nacional|
	artista_nacional := ArtistaNacional new.
	artista_nacional establecerNombreArtista: 'Tan Bionica'.
	artista_nacional establecerEventoArtista: 'La Ultima Noche Magica en River'.
	artista_nacional establecerTarifaArtista: 50000.
	self assert: (artista_nacional costoArtista) equals: 50000 log.! !

!ArtistaNacionalTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 21:35'!
test03PruebaIngresaTarifaDelArtistaEnNegativo
	|artista_nacional|
	artista_nacional := ArtistaNacional new.
	self should: [artista_nacional establecerTarifaArtista: -1] raise: ArtistaIngresaSuTarifaEnNegativoError.! !

!ArtistaNacionalTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 21:33'!
test02PruebaArtistaIngresaNombreEnVacio
	|artista_nacional|
	artista_nacional := ArtistaNacional new.
	self should: [artista_nacional establecerNombreArtista: ' '] raise: ArtistaIngresaNombreEnVacioError.! !


TestCase subclass: #CampoTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Test individuales'!

!CampoTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 04:33'!
test01CalcularElCostoDeUnaUbicacionDelCampo
	|campo|
	campo := Campo new.
	campo ingresarNombreEvento: 'La Ultima Noche Magica en River'.
	campo ingresarNombreUbicacion: 'Campo General'.
	campo ingresarTarifaUbicacion: 16000.
	self assert: (campo calcularCosto) equals: 16000.! !


TestCase subclass: #EfectivoTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Test individuales'!

!EfectivoTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 21:28'!
test02EfectivoLanzaErrorPorImporteNegativo
	|efectivo|
	efectivo := Efectivo new.
	self should: [efectivo aplicarDescuentoAImporte: -100] raise: EfectivoIngresaElImporteEnValorNegativoError.! !

!EfectivoTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 04:44'!
test01AplicandoDescuentoAUnPagoEnEfectivo
	|objeto_efectivo|
	objeto_efectivo := Efectivo new.
	self assert: (objeto_efectivo aplicarDescuentoAImporte: 2000) equals: 2000.! !


TestCase subclass: #PlateaPreferencialTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Test individuales'!

!PlateaPreferencialTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 04:15'!
test01CalcularElCostoDeUnaUbicacionDePlateaPreferencial
	|platea_preferencial ubicacion_elegida|
	platea_preferencial := PlateaPreferencial new.
	ubicacion_elegida := 'D018'.
	platea_preferencial ingresarNombreEvento: 'La Ultima Noche Magica en River'.
	platea_preferencial ingresarNombreUbicacion: ubicacion_elegida.
	platea_preferencial ingresarTarifaUbicacion: 2000.
	self assert: (platea_preferencial calcularCosto) equals: 18*2000.! !


TestCase subclass: #TarjetaTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Test individuales'!

!TarjetaTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 13:20'!
test03PruebaParaElCalculoDelDescuento
	|tarjeta resultado_esperado|
	tarjeta := Tarjeta new.
	resultado_esperado := (341000*20)/100.
	self assert: (tarjeta calcularDescuento: 341000) equals: resultado_esperado.! !

!TarjetaTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 12:44'!
test02ProbarIngresarElNombreDeLaTarjeta
	|tarjeta|
	tarjeta := Tarjeta new.
	tarjeta ingresarNombreTarjeta: 'Patagonia'.
	self assert: tarjeta obtenerNombreTarjeta equals: 'Patagonia'.! !

!TarjetaTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 21:19'!
test05TarjetaLanzaErrorPorNombreVacio
	|tarjeta|
	tarjeta := Tarjeta new.
	self should: [tarjeta ingresarNombreTarjeta: ' '] raise: TarjetaIngresaSuNombreEnVacioError.! !

!TarjetaTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 12:37'!
test01IngresarNombreDeLaTarjetaConNombre
	|tarjeta|
	tarjeta := Tarjeta conNombre: 'Patagonia'.
	self assert: (tarjeta isKindOf: Tarjeta).
	self assert: tarjeta obtenerNombreTarjeta equals: 'Patagonia'! !

!TarjetaTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 13:51'!
test04PruebaParaElImporteConElDescuentoYaAplicado
	|tarjeta resultado_esperado|
	tarjeta := Tarjeta new.
	resultado_esperado := 341000 - (tarjeta calcularDescuento: 341000).
	self assert: (tarjeta aplicarDescuentoAImporte: 341000) equals: resultado_esperado.! !

!TarjetaTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 21:23'!
test06TarjetaLanzaErrorPorImporteNegativo
	|tarjeta|
	tarjeta := Tarjeta new.
	self should: [tarjeta aplicarDescuentoAImporte: -100] raise: TarjetaIngresaUnImporteNegativoError.! !


TestCase subclass: #VipTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-97538-Test individuales'!

!VipTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 02:58'!
test01IngresaLaCantidadDeLugaresDisponibles
	|vip|
	vip := Vip new.
	vip ingresarCantidadLugaresDisponibles: 2.
	self assert: (vip getCantidadLugaresDisponibles) equals: 2. ! !

!VipTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 21:09'!
test04LanzaErrorPorCantidadNegativaIngresadaEnLaTarifa
	|vip|
	vip := Vip new.
	self should: [vip ingresarTarifaUbicacion: -40000] raise: UbicacionIngresaTarifaUbicacionUnNumeroNegativoError.! !

!VipTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 21:16'!
test05LanzaErrorPorNombreVacio
	|vip|
	vip := Vip new.
	self should: [vip ingresarNombreEvento: ' '] raise: UbicacionIngresaNombreVacioError.! !

!VipTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 04:21'!
test02CalcularElCostoDeUnaUbicacionVip 
	|vip|
	vip := Vip new.
	vip ingresarNombreEvento: 'La Ultima Noche Magica en River'.
	vip ingresarNombreUbicacion: 'Hospitality'.
	vip ingresarTarifaUbicacion: 40000.
	vip ingresarCantidadLugaresDisponibles: 2.
	self assert: vip calcularCosto equals: (40000/ 2).
	! !

!VipTest methodsFor: 'tests' stamp: 'Fernando 10/21/2023 21:04'!
test03LanzaErrorPorCantidadNegativaIngresadaDeLugares
	|vip|
	vip := Vip new.
	self should: [vip ingresarCantidadLugaresDisponibles: -1] raise: VipIngresaCantidadNegativaDeLugaresDisponiblesError.
	! !
