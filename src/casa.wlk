import cosas.* 

object casa {
	const cosas = []
	
	method cosas() = cosas
	method comprar(cosa){ cosas.add(cosa) }
	method cantidadDeCosasCompradas() = cosas.size()
	method tieneComida() = cosas.any(  { c => c.esComida() })
	method vieneDeEquiparse() = 
		cosas.last().esElectrodomestico() or 
		cosas.last().precio() > 5000
	// method esDerrochona() = cosas.map( { c => c.precio() } ).sum() >= 9000 
	method esDerrochona() = cosas.sum( { c => c.precio() } ) >= 9000
	method compraMasCara() = cosas.max( { c => c.precio() } )
	method electrodomesticosComprados() = 
		cosas.filter(  { c => c.esElectrodomestico() })
	method malaEpoca() = 
		cosas.all( { c => c.esComida() } )
	method queFaltaComprar(lista) =
		lista.asSet().difference(cosas.asSet())
	method 	faltaComida() = cosas.count( { c => c.esComida() } ) < 2
	
	
	method gastoEnComida() = 
		self.listaDeComida().sum( { c => c.precio() } )
	
	method comidaMasCara() = 
		self.listaDeComida().max( { c => c.precio() } )
		
	method listaDeComida() = cosas.filter( { c => c.esComida() } )
	
	method hayElectrodomesticosBaratos() = 
		self.electrodomesticosComprados().any( { c => c.precio() < 3000 } )
	
	method preciosDeElectrodomesticos() =
		self.electrodomesticosComprados().map(  { c => c.precio() })
	
	method nivelEnAumento() = 
		cosas.last().precio() >= cosas.first().precio() * 2
	
	method primeraComidaComprada() = 
		self.listaDeComida().first() //en listas se puede hacer asi
	
	method primeraComidaCompradaConFind() = cosas.find(  { c => c.esComida() })
	
}
