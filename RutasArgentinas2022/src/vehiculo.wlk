import clima.*

class Vehiculo {
	var property velocidadBase
	var property ruedas=[]
  
	method velocidadVehiculo() = self.velocidadBase() - clima.resistenciaViento()
	method velocidadBase()
	//1.
	method velocidadFinal(ruta) = ruta.velocidadMaxima().min(self.velocidadVehiculo()) 
	
	method tiempoTardaRecorrer(ruta){
		return ruta.extensionKm()/self.velocidadFinal(ruta)
	}
	
	method aplicarDesgasteRueda(unaCantidad){
		ruedas.forEach({rueda => rueda.desgasta(unaCantidad)})
	}
	
    //2.
	method camino(caminos){
		return caminos.sum{ruta=>self.tiempoTardaRecorrer(ruta)}
	}
	
	//3.
	
	method realizarViaje(camino){
		camino.forEach{ruta => self.aplicarDesgasteRueda(ruta.desgastar(self))}
	}
	

    	
}

class Particular inherits Vehiculo{
	override method velocidadBase()= velocidadBase	
}

class Carga inherits Vehiculo{
	var property carga
	
	override method velocidadBase(){
		if(carga < 40){
			return 80
		}else{
			return 60
		}
	}
	//desgaste el doble las ruedas- no pude implementar el super()
	override method aplicarDesgasteRueda(unaCantidad){
		super(unaCantidad*2) //repito logica
	}
	
}

class Pasajero inherits Vehiculo{
	var property pasajeros
	override method velocidadBase(){
		return 120-pasajeros 
	}
	
}

/*Ejemplo implementacion-parte1
 * const ruta33= new Ruta(tipo= asfalto, extensionKm=100, velocidadMaxima = 50)
 * const camionetaCarga = new Carga(carga = 3, ruedas=[r1,r2,r3,r4])
 * clima.resistenciaViento(15)
 * camionetaCarga.velocidadVehiculo() -- 65km/h
 * camioneta.velocidadFinal(ruta33) -- 50km/h
 * camioneta.tiempoTardaRecorrer(ruta33) --2hs
 * 
 * const ruta40 = new Ruta(tipo = ripio,extensionKm= 100)
 * const lilyMalone = new Carga(carga = 50, ruedas=[r1',r2',r3',....,r24']) 
 * lilyMaloy.velocidadFinalVehiculo()-- 45km/h
 * lilyMaloy.aplicarDesgasteRueda(ruta40) -- aplica a c/u ruedas 4.5
 * Ruedas 
 * 
 * const rueda1 = new Rueda(nivelDeDesgaste=13)
 * const rueda2 = new Rueda(nivelDeDesgaste=13)
 * const rueda3 = new Rueda(nivelDeDesgaste=35)
 * const rueda4 = new Rueda(nivelDeDesgaste=40)
 * 
 * const rueda1'= new Rueda(nivelDeDesgaste = 0)
 * const rueda2'= new Rueda(nivelDeDesgaste = 0)
 * ...
 * const rueda24'=new Rueda(nivelDeDesgaste = 0)
 * 
 * 
 * camionetaCarga.aplicarDesgasteRueda(ruta33) /17 17 39 40
 * 
 * */
