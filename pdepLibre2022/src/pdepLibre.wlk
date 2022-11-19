object pdepLibre {
	var property usuarios=[]
	var property productos=[]
	 /*1.Reducir puntos a los usuarios morosos. A aquellos que tienen dinero en números negativos se 
     * les bajarán 1.000 puntos.
	*/
	
	method reducirPuntosMorosos(){
		self.usuariosMorosos().forEach({usuario=> usuario.reducirPuntos(1000)})
	}
	method usuariosMorosos(){
		return usuarios.filter{usuario=> usuario.moroso()}
	}
	//2.Eliminar los cupones utilizados de cada usuario. NO ME SALE 
	method eliminarCuponUsadoUsario(cupon){
		return usuarios.forEach({usuario => usuario.eliminarCuponesUtilizados()})
	}
	
	/*3.Obtener los nombres de oferta de sus productos. En el caso de los muebles e
	 *indumentaria se les antepone “SUPER OFERTA” al nombre. A las gangas además de 
	 * eso se les agrega “COMPRAME POR FAVOR” al final. */
	 
	 method obtenerNombreOfertaProductos(){
	 	return productos.map{producto => producto.nombreOferta()}
	 }
	 
	 /*4. Actualizar los niveles de todos sus usuarios. En base a los puntos cada usuario debe
	  *  tener el nivel que le corresponde. */
	 
	 method actualizarNiveles(){
	 	usuarios.forEach({usuario=> usuario.actualizarNivel()})
	 }
	 
	
	
}
