object armaduraMandaloriana {
  method defensa() = 5
}

object pistolaBlaster {
  var balas = 20
  
  method danio() = 5
  method perderBala() {
    balas -= 1
  }
}

class Soldado {
  var energia = 100
  var vida = 100
  var armadura
  var armas
  
  method caminar() {
    energia -= 5
  }
  
  method saltar() {
    
  }
  
  method atacar(atacado) {
    const arma = armas.anyOne()
    const danioBase = arma.danio() 
    arma.perderBala()
    atacado.recibirDanio(danioBase)
  }
  method recibirDanio(danioBase) {
    vida -= 0.max(danioBase - armadura.defensa())
  }
}

// Ahora con new podemos instanciar a los distintos soldados
// const jangoFett = new Soldado(...)
// const trooper = new Soldado(...)
// const artillero = new Soldado(...)
// const trooperArc = new Soldado(...)
// Cada uno es un objeto
// - Tienen mismo comportamiento traido de la clase Soldado
// - Tienen mismos atributos
// - Cada uno tiene un estado distinto (armadura, vida, energia)