import clima.*

class Ruta{
	const property extensionKm
	var property tipo // ruta|ripio|asfalto
	//4.
	method mejorarRuta()= tipo.mejorar(self)

	method desgastar(vehiculo) = vehiculo.aplicarDesgasteRueda(tipo.nivelDesgaste(vehiculo,self))
	
}

class TipoRuta{
	method velocidadMaxima()
	method nivelDesgaste(vehiculo, ruta) = vehiculo.velocidadFinal(ruta)/10 	
	method mejorar(ruta)
}

object tierra inherits TipoRuta{
	override method velocidadMaxima()= 10.max(60 - clima.lluviaCaida()) 
	override method mejorar(ruta){
		ruta.tipo(ripio)
	}
		
}

object ripio inherits TipoRuta{
	 override method velocidadMaxima()= 80
	 override method mejorar(ruta){
	 	ruta.tipo(new Asfalto(velocidadMaxima = 60))
	 }
	
}

class Asfalto inherits TipoRuta{
	var property velocidadMaxima=12
	
	override method velocidadMaxima() {
		return velocidadMaxima
	} 
	
	override method nivelDesgaste(vehiculo, ruta){
		 return vehiculo.tiempoTardaRecorrer(ruta)/1
	}
	
	override method mejorar(ruta){
		ruta.tipo(new Asfalto(velocidadMaxima= velocidadMaxima + 5))
	}
	
}