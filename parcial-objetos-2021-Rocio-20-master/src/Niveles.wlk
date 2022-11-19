class Nivel{
	method limiteProductos()
	method puntosRequeridosAscender()
	method cumpleCantidadMaxima(cantidadProductos) = self.limiteProductos() >= cantidadProductos
	method cumpleConPuntos(puntos) = self.puntosRequeridosAscender() <= puntos
	method proximoNivel()
}


object bronce inherits Nivel{
   override method limiteProductos() = 1
   override method puntosRequeridosAscender() = 5000
   override method proximoNivel() = plata
}

object plata inherits Nivel{
   override method limiteProductos() = 5
   override method puntosRequeridosAscender() = 15000
   override method proximoNivel() = oro
}

object oro inherits Nivel{
   override method limiteProductos() = throw new Exception(message = "No tiene limite de productos")
   override method puntosRequeridosAscender() = throw new Exception(message = "No asciende porque es el maximo nivel")
   override method proximoNivel() = self
   override method cumpleCantidadMaxima(cantidadProductos) = true
}
