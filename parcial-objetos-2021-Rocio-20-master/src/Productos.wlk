class Producto{
	const nombre
	var precioBase
	const iva = 1.21
	
	method precioOficial() = precioBase * iva + self.recargo()
	method recargo()
	method nombreDeOferta() = "SUPER OFERTA " + nombre
}

class Mueble inherits Producto{
	override method recargo() = 1000
}

class Indumentaria inherits Producto{
	override method recargo() = 0
}

class Ganga inherits Producto{
	override method recargo() = 0
	override method precioOficial() = 0
	override method nombreDeOferta() = nombre + " COMPRE POR FAVOR"
}
