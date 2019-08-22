object pepita {
	var energia = 100

	method estaCansada() {
		return energia < 50
	}

	method vola(kms) {
		energia -= 10 + kms
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}
	
	method estaFeliz(){
		return energia.between(500,1000)
	}
	
	method cuantoQuiereVolar(){
		var distanciaDeVuelo
		distanciaDeVuelo = energia / 5
		if(energia.between(300,400)){
			distanciaDeVuelo += 10
		}
		if(energia % 20 == 0){
			distanciaDeVuelo += 15
		}
		return distanciaDeVuelo
	}
	
	method salirAComer(){
		self.vola(5)
		self.come(alpiste)
		self.vola(5)
	}
	method haceLoQueQuieras(){
		if(self.estaCansada()){
			self.come(alpiste)
		}
		if(self.estaFeliz()){
			self.vola(8)
		}
	}
}

object alpiste {
	var gramos = 10
	
	method energiaQueOtorga() { 
		return 4 * gramos
	}
	
	method gramos(nuevosGramos) {
		gramos = nuevosGramos
	}	
}

object manzana {
	method energiaQueOtorga() { 
		return 50
	}	
}

object mijo {
	var estaMojado = false
	method energiaQueOtorga() { 
		if(estaMojado){
			return 15
		}else{
			return 20
		}
	}	
	method mojarse(){
		estaMojado = true 
	}
	method secarse(){
		estaMojado = false
	}
}

object canelon {
	var energia = 20
	var tieneSalsa = false
	var tieneQueso = false
	method ponerOSacarSalsa(){
		tieneSalsa = tieneSalsa.negate()
	}
	method ponerOSacarQueso(){
		tieneQueso = tieneSalsa.negate()
	}
	method energiaQueOtorga() { 
		energia = 20
		if(tieneSalsa){
			return energia + 5
		}
		if(tieneQueso){
			return energia + 7
		}
		if(tieneQueso && tieneSalsa){
			return energia + 5 + 7
		}
		return energia
	}	

}