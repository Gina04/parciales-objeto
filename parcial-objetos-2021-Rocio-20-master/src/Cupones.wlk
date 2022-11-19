class Cupon{
	var property fueUsado = false
	var porcentajeDeDescuento
	
	method seAplica(costo){
		fueUsado = true
		return costo*porcentajeDeDescuento 
	}
}
