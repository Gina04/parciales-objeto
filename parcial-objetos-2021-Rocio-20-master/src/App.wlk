import Usuarios.*
import Productos.*

object app{
	var usuarios = #{}
	var productos = []
	
	method nuevoUsuario(usuario){
		usuarios.add(usuario)
	}
	
	method agregarNuevoProducto(producto){
		productos.add(producto)
	}
	
	method reducirPuntosUsuariosMorosos(){
		(self.usuariosMorosos()).forEach({usuario => usuario.pierdePuntos(1000)})
	}
	method usuariosMorosos(){
		return usuarios.filter({usuario => usuario.esMoroso()})
	}
	method eliminarCuponesUtilizadosUsuarios(){
		usuarios.forEach({usuario => usuario.eliminarCuponesUtilizados()})
	}
	method nombreOfertaProducto(){
		return productos.map({producto => producto.nombreDeOferta()})
	}
	method actualizarNivelDeUsuarios(){
		usuarios.forEach({usuario => usuario.subeDeNivel()})
	}
	method calcularCosto(productosRequeridos){
		return productosRequeridos.sum({producto => producto.precioOficial()})
	}
}
