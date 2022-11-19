class Sobreviviente{
	var property resistencia
	var property carisma
	var property estado // saludable|arrebatado|infectado|desmayado
	var property armas=[]
	var property cantidadBasePunto
	
	//1.b hacer que una persona/sobreviviente ataque un caminante
	method puedeAtacar(caminante){
		if(resistencia>12){
			self.disminuirResistencia(2)
			estado.efectoAtaque(self)
		}
	}
		
	method disminuirResistencia(unaCantidad){
		resistencia-= unaCantidad 
		
	}
	
	method aumentarCarisma(unaCantidad){
		carisma+=unaCantidad
	}
	method aumentarResistencia(unaCantidad){
		carisma+= unaCantidad
	}
	
	method poderOfensivo(){
		return self.arma() + self.poderPropio() 
	}
	//devuelve una de sus armas
	method arma(){
		return armas.atRandom()
	}
	
	method poderPropio(){
		return cantidadBasePunto * (1 + carisma / 100)
	}
	//2.a
	method tomarGuarnicionCuradora(){
		estado.comerGuarnicion()
		
	}
	//2.b
	method agregarArmas(unaArmas){
		armas.addAll(unaArmas)
	}
	
	method resistenciaMenor(unaCantidad){
		return resistencia < unaCantidad
	}
}



class Predador inherits Sobreviviente{
	var property esclavos = []
	
	override method puedeAtacar(caminante){
		self.esclavizar(caminante)
	}
	
	method esclavizar(caminate){
		if(caminate.estaDebil()){
			esclavos.add(caminate)
		}
	}
	
	override method poderOfensivo(){
		return super()/2 + self.poderCorrosivoSusCaminantes()
	}
	
	method poderCorrosivoSusCaminantes(){
		return esclavos.sum{esclavo => esclavo.poderCorrosivo()}
	}
	

		
	method tieneArmaRuidosa(){
		return armas.any{arma=>arma.esRuidosa()}
	}
	
	method perderArmaAzar(){
		return armas.anyOne()
	}
	
}