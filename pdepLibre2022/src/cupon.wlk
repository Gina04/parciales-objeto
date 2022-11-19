class Cupon {
	var property usado= false // no fue usado
	var property porcentaje= 0.10
	
	method aplicar(unPrecio){
		if(!self.usado()){
			usado = true
		   return self.aplicarDescuento(unPrecio)//800 -> 10% = 80
		}else{
			self.error("Este cupon ya fue usado")
			return 0
		}
	}
	
	method aplicarDescuento(unPrecio){
		 return unPrecio - (unPrecio * porcentaje)
	}
	
}
