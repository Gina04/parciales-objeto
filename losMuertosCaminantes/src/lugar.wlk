import tipoEstado.*

class Lugar {
	var property sobrevivientes=[]
	var property caminantes = []
	
	method poderSobrevivienteMayorPoderCaminante(){
		return self.sumaPoderSobrevivientes() > self.sumaPoderCaminante()
	
	}
	
	method sumaPoderSobrevivientes(){
		return sobrevivientes.sum{sobreviviente=>sobreviviente.poderOfensivo()}
	}
	
	method sumaPoderCaminante(){
		return caminantes.sum{caminate=> caminate.poderCorrosivo()}
	}
	
	method lider(){
		return sobrevivientes.max{sobreviviente => sobreviviente.carisma()}
	}
	//3.b
	method miembreMasDebil(){
		return sobrevivientes.min{sobreviente=>sobreviente.poderOfensivo()}
		
	}
	method darArmaMiembroMasDebil(armas){
		self.miembreMasDebil().agregarArmas(armas)
	}
	//3.c
	method tomarLugar(){
		if(self.poderSobrevivienteMayorPoderCaminante() && self.complejidadExtra()){
			self.moverserDeLugar()
			self.atacarALosCaminantes()
			self.tomarAlgoEnElLugar()
		}else{
			self.pierdeIntegranteMasDebil(self.miembreMasDebil())
			self.integrantesJodidos(infectado)
		}
	}
	
	
	method atacarALosCaminantes(){
		caminantes.forEach{caminante=> self.integranteAzar().puedeAtacar(caminante)}	
	}
	
	method integranteAzar(){
		return self.puedenAtacar().anyOne()
	}
	method moverserDeLugar(){
		self.agregarUsurpadores(sobrevivientes)
	}
	
	method agregarUsurpadores(unosUsurpadores)
	
	method integrantesJodidos(unEstado){
		sobrevivientes.forEach{integrante=> integrante.estado(unEstado)}
	}
	method pierdeIntegranteMasDebil(unIntegrante){
		return sobrevivientes.remove(unIntegrante)
	}
	method complejidadExtra()= true
	method tomarAlgoEnElLugar()
	
	//1.a
	
	method puedenAtacar(){
		return sobrevivientes.fitler{sobreviviente=>sobreviviente.puedeAtacar()}
	}
	 
	//1.c
	method poderOfensivoGrupo(){
		return self.sumaPoderSobrevivientes() * self.lider().carisma()
	}
	
	
	
	
}

class Prision inherits Lugar{
	const property cantPabellones 
	const property armeria=[]
	var property usupadores=[]
	
	override method agregarUsurpadores(unosUsurpadores){
		usupadores.addall(unosUsurpadores)
	}
	override method tomarAlgoEnElLugar(){
		if(!armeria.isEmpty()){
			self.darArmaMiembroMasDebil(armeria)
		}
	}
	
	override method complejidadExtra(){
	  return self.sumaPoderSobrevivientes() > cantPabellones * 2
	    
	}
	
}

class Granja inherits Lugar{
	var property usurpadores=[]
	
	override method agregarUsurpadores(unosUsurpadores){
		usurpadores.addall(unosUsurpadores)
	}
	override method tomarAlgoEnElLugar(){
		sobrevivientes.forEach({sobreviente=>sobreviente.tomarGuarnicionCuradora()})	
	}
}

class Bosque inherits Lugar{
	var property usurpadores=[]
	 var property niebla= true
	
	override method agregarUsurpadores(unosUsurpadores){
		usurpadores.addall(unosUsurpadores)
	}
 
  override method tomarAlgoEnElLugar(){
  	if(niebla){
  		self.integranteAzar().perderArmaAzar()
  	}
  }	
	
  override method complejidadExtra(){
  	 return self.noPoseenArmasRuidosa()
  }	
  
  method noPoseenArmasRuidosa(){
  	return sobrevivientes.all{sobreviviente=>!sobreviviente.tieneArmaRuidosa()}
  }
}
