
object saludable{
	method efectoAtaque(sobreviviente){
		sobreviviente.resistencia()
	}
	method comer(sobreviviente){
		sobreviviente.carisma()
		sobreviviente.resistencia()
		
	}
}

object arrebatado{
	method efectoAtaque(sobreviviente){
		sobreviviente.aumentarCarisma(1)
	}
	
	method comer(sobreviente){
		sobreviente.aumentarResistencia(50)
		sobreviente.aumentarCarisma(20)
	}	
}

object infectado{
	var property desmayado =false
	var cantidadAtaque=0 
	
	method efectoAtaque(sobreviviente){
		cantidadAtaque+=1
		sobreviviente.disminuirResistencia(3)
		if(cantidadAtaque ==5){
			desmayado =true
	}
 }	
	
	method comer(sobreviviente){
	  if(cantidadAtaque>3){
	  	cantidadAtaque= 0
	  }else{
	  	sobreviviente.estado(saludable)
	  }
		sobreviviente.aumentarResistencia(40)	  	
	}

}

object desmayado{
	method efectoAtaque(sobreviviente){
		sobreviviente.resistencia()
	}
	
	method comer(sobreviviente){
		sobreviviente.estado(saludable)
	}
}
	
	
