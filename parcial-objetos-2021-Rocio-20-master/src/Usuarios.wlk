import App.*

class Usuario{
	const nombre
	var dineroDisponible
	var property puntos
	var nivel
	const productosEnCarrito = []
	const cupones = []
	
	method agregarCupon(cupon){
		cupones.add(cupon)
	}
	
	method agregarProductoACarrito(producto){
		if(nivel.cumpleCantidadMaxima(productosEnCarrito.size())){
			productosEnCarrito.add(producto)
		}else{
			throw new Exception(message = "No esta habilitado a agregar más productos")
		}
	}
	
	method comprarProductosEnCarrito(){
		const costoCompra = app.calcularCosto(productosEnCarrito)
		const costoTotal = self.aplicarCualquierCuponHabilitado(costoCompra)
		self.cobrarCompra(costoTotal)
		self.sumarPuntos(costoTotal *0.10)
	}
	
	method aplicarCualquierCuponHabilitado(costo){
		if(cupones.isEmpty()){
			return costo
		}else{
			return (self.cuponesNoUsados().anyOne()).seAplica(costo)
		}
	}
	
	method cuponesNoUsados(){
		return cupones.filter({cupon => !cupon.fueUsado()})
	}
	
	method cobrarCompra(costo){
		dineroDisponible -= costo
	}
	
	method sumarPuntos(puntosPorCompra){
		puntos += puntosPorCompra
	}
	
	method pierdePuntos(cantidad){
		puntos -= 0.max(puntos - cantidad)
	}
	
	method esMoroso() = dineroDisponible < 0
	
	method eliminarCuponesUtilizados(){
		cupones.removeAllSuchThat({cupon => cupon.fueUsado()})
	}
	method subeDeNivel(){
		if(nivel.cumpleConPuntos(self.puntos())){
			nivel = nivel.proximoNivel()
		}
	}
	
}
