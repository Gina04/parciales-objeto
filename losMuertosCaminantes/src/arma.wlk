class Arma {
	var property calibre 
	var property potenciaDestructiva
	method potenciaOfensivo(){
		return calibre*2 + potenciaDestructiva 
	}
	
	method esRuidosa()
	
}

//Objetos??
class Ruidosa inherits Arma{
	override method esRuidosa()= true
}

class Silencioca inherits Arma{
	override method esRuidosa()= false
}
