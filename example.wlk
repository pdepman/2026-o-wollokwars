// Punto 1
object jangoFett {
  const armas = [pistolaBlaster]
  var armadura = armaduraMandalorian
  var energia = 100
  var vida = 100
  var nivel = 10
  
  method caminar() {
    energia -= 5
  }
  
  method saltar() {
    
  }
  
  method atacar(atacado) {
    const arma = armas.anyOne()
    arma.atacar(atacado)
  }
  
  method recibirDanio(danio) {
    const danioAplicado = danio - armadura.defensa()
    vida -= danioAplicado.max(0) // no permite ir a negativo 
  }
  
  method cambiarArmadura(nuevaArmadura) {
    armadura = nuevaArmadura
  }
  
  method agregarArma(nuevaArma) {
    armas.push(nuevaArma)
  }
}

object pistolaBlaster {
  var balas = 20
  const danioBase = 5
  
  method danio(nivelAtacante) = danioBase * (1 + (nivelAtacante / 100))
  
  method atacar(atacado, nivel) {
    // proxima clase: ver excepciones
    balas -= 1
    atacado.recibirDanio(self.danio(nivel))
  }
}

object armaduraMandalorian {
  const defensa = 5
  
  method defensa() = defensa
} 

// Punto 2

class Soldado {
  const armas
  var armadura
  var energia = 100
  var vida = 100
  var nivel
  
  method caminar() {
    energia -= 5
  }
  
  method saltar() {
    
  }
  
  method atacar(atacado) {
    const arma = armas.anyOne()
    arma.atacar(atacado, nivel)
  }
  
  method recibirDanio(danio) {
    const danioAplicado = danio - armadura.defensa()
    vida -= danioAplicado.max(0) // no permite ir a negativo 
  }
  
  method cambiarArmadura(nuevaArmadura) {
    armadura = nuevaArmadura
  }
  
  method agregarArma(nuevaArma) {
    armas.push(nuevaArma)
  }
}

class Arma {
  var balas
  const danioBase
  
  method danio(nivelAtacante) = danioBase * (1 + (nivelAtacante / 100))
  
  method atacar(atacado, nivel) {
    // proxima clase: ver excepciones
    balas -= 1
    atacado.recibirDanio(self.danio(nivel))
  }
}

const pistolaBlaster2 = new Arma(balas = 20, danioBase = 5)
const rifleBlaster = new Arma(balas = 50, danioBase = 15)

class Armadura {
  const defensa
  
  method defensa() = defensa
}

const armaduraAsaltoComun = new Armadura(defensa = 5)
const armaduraArtillero = new Armadura(defensa = 30)
const armaduraARC = new Armadura(defensa = 15)


const jangoFett2 = new Soldado(
  armas = [pistolaBlaster],
  armadura = armaduraMandalorian,
  nivel = 10
)

const trooper = new Soldado(
  armas = [rifleBlaster],
  armadura = armaduraAsaltoComun,
  nivel = 1
)

const artillero = new Soldado(
  armas = [],
  armadura = armaduraArtillero,
  nivel = 1
)

const pistolaBlasterArc = new Arma(balas = 20, danioBase = 5)
const rifleBlasterArc = new Arma(balas = 50, danioBase = 15)

const arcTrooper = new Soldado(
  armas = [pistolaBlasterArc, rifleBlasterArc],
  armadura = armaduraARC,
  nivel = 5
)