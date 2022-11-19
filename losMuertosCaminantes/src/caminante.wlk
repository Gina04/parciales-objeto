class Caminante{
	var property sedSangre
	var property somnoliento = false
	const property dientes
	
	method poderCorrosivo() = 2 * sedSangre + dientes
	
	method estaDebil(){
		return sedSangre < 15 && somnoliento
	}
}
