class Usuario{
	const property nombre 
	var property dinero
	var property puntos 
	var property nivel //oro|bronce|plata
	var property carrito = []
	var property cupos = #{}
	
	method agregarProducto(unProducto) = carrito.add(unProducto)
	
	method comprar(){
		const precioFinalConDescuento = self.precioTotalCarritoAplicoCupo()
		self.disminuirCuenta(precioFinalConDescuento)
		self.sumarPuntos(precioFinalConDescuento * 0.10)
	}
	  method precioTotalCarrito(){
 		return carrito.sum{producto => producto.precioFinal()}
    }
    
     method sumarPuntos(unaCantidad){
    	puntos+=unaCantidad
     }
    
     method disminuirCuenta(unValor){
     	dinero-=unValor
     }
     
     method precioTotalCarritoAplicoCupo(){
     	return self.elegirCupoAzar().aplicar(self.precioTotalCarrito())
     }
    
   
    method cuponesDisponibles(){//cupones no usados.
    	return cupos.filter{cupo => !cupo.usado()} // false -> disponible, true-> no disponible
    }
    
    method elegirCupoAzar(){
    	return self.cuponesDisponibles().anyOne()    
    }
    
    method reducirPuntos(unaCantidad){
    	puntos-=unaCantidad
    }
    
    method moroso(){
    	return dinero < 0
    }
    
   method actualizarNivel() {
	   if(nivel.cumpleConPuntos(puntos)){
	   	nivel = nivel.proximoNivel()
	   }
	}
	
	method agregarProductoCarrito(producto){
		if(nivel.cumpleConCantidadMaxima(carrito.size())){
			self.agregarProducto(producto)
		}else{
			self.error("No esta habilitado agregar más productos")
		}
	}
	
	method eliminarCuponesUtilizados(){
		return cupos.removeAllSuchThat({cupon=>cupon.usado()})
	}
	
	 
}

class Nivel{
	method limiteProductos()
	method puntosParaAcceder()
	method cumpleConCantidadMaxima(cantidadProductos) = self.limiteProductos() <= cantidadProductos
	method cumpleConPuntos(puntos) = self.puntosParaAcceder()<= puntos
	method proximoNivel()
	
}

object plata inherits Nivel{
	override method limiteProductos()= 5
	override method puntosParaAcceder()= 5000
	override method proximoNivel() = oro
	
	
}

object bronce inherits Nivel{
	override method limiteProductos() = 1
	override method puntosParaAcceder() = 1
	override method proximoNivel() = plata
}

object oro inherits Nivel{
	override method limiteProductos()= throw new Exception("No tiene limite de productos")
	override method puntosParaAcceder() = 15000
	override method proximoNivel() = self
}
