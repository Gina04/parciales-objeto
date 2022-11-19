class Producto{
	const property nombre
	var property precioBase
	const precioIva = 21
	
	method precioFinal(){
		return self.precioBase() + precioIva + self.extraRecargo()
	} 
	
	method extraRecargo()
	
    method nombreOferta()= self.unString() + nombre
    
    method unString()= "SUPER OFERTA" 
	
}

class Mueble inherits Producto{
	override method extraRecargo()= 1000
	
}

class Indumentaria inherits Producto{
	override method extraRecargo()=0
}

class Ganga inherits Producto{
	override method precioFinal()= 0
	
	override method nombreOferta()= nombre + "COMPRAME POR FAVOR"
}