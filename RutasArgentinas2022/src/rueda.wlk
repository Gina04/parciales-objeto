class Rueda {
	var property nivelDesgaste

	method sumarDesgaste(unaCantidad){
		nivelDesgaste+= unaCantidad
	}
	
	
	method desgasta(unaCantidad){
		nivelDesgaste+=unaCantidad
		
		if(nivelDesgaste > 100){
			self.error("El desgaste de la ruedad esta por encima de los 100 puntos")
		}
	}
	
	
}
