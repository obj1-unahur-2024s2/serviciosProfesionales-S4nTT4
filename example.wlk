class Universidad {
  const property provincia
  var property honorarios 
}

class AsociadoAUniversidad {
  const property universidad
  method honorarios(){
    return universidad.honorarios()
  }
  method puedeTrabajar() {
    return universidad.provincia()
  }
}

class AsociadoALitoral {
  const property universidad
  method puedeTrabajar() = ["Entre Rios","Santa Fe","Corrientes"]
  method honorarios() = 3000
}

class Libre {
  const property unviersidad
  var property puedeTrabajar = []
  var property honorarios=0  
}

class Empresa {
  const property profesionales = []
  var property honorariosReferencia 
  method agregarProfesionales(unProfesional){
    profesionales.add(unProfesional)
  }

  method cuantos(universidad){
    return profesionales.count({p => p.universidad() == universidad})
  }

  method caros() {
    return profesionales.filter({p => p.honorarios() > honorariosReferencia})
  }

  //Convierte una lista en un cojunto(no permite elementos repetidos).
  method formadoras(){
    return profesionales.map({p => p.universidad()}).asSet()
  }

  method masBarato(){
    return profesionales.min({p => p.honorarios()})
  }

  method esDeGenteAcotada(){
    return not profesionales.any({p => p.puedeTrabajar().size() > 3})
  }
}
