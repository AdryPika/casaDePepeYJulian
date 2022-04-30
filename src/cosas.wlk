object heladera {
	method precio() { return 20000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object cama {
	method precio() { return 8000 }
	method esComida() { return false }
	method esElectrodomestico() { return false }	
}

object tiraDeAsado {
	method precio() { return 350 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object paqueteDeFideos {
	method precio() { return 50 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object plancha {
	method precio() { return 1200 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object milanesas {
	var precio = 260
	
	method precio(unValor) { precio = unValor }
	method precio () { return precio}
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}


object salsaDeTomates{
	var precio = 90
	
	method precio(unValor) { precio = unValor }
	method precio () { return precio}
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object microondas{
	method precio() { return 4200 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object kiloDeCebollas {
	method precio() { return 25 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object compu{
	method precio() { return 500 * dolar.cotizacion() }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object dolar{
	method cotizacion() { return 200 }
}

object packComida {
	var plato
	var aderezo
	const platosValidos = []
	const aderezosValidos = []
	
	method platosValidos(listaPlatos){
		platosValidos.addAll(listaPlatos)
	}
	
	method aderezosValidos(listaAderezos){
		aderezosValidos.addAll(listaAderezos)
	}
	
	method configurarPackComida(unPlato, unAderezo){
		if (not platosValidos.contains(unPlato) ) self.error("No es un plato valido")
		if (not aderezosValidos.contains(unAderezo) ) self.error("No es un derezo valido")
		plato = unPlato
		aderezo = unAderezo
	}
	method precio() { return plato.precio() + aderezo.precio() }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object packRegalo{
	const componentes = []
	
	method agregarComponentes(cosa){componentes.add(cosa) }
	method quitarComponentes(cosa){ componentes.remove(cosa) }
	method componentes() = componentes
	
	method precio() = componentes.sum (  { c => c.precio() }) * 0.8
	method esComida() = componentes.all( { c => c.esComida() } )
	method esElectrodomestico() = componentes.any(  {  c=> c.esElectrodomestico() })	

} 
