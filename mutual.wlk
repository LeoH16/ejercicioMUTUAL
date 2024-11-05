class Actividad {
  const property idiomas = #{}
  method esInteresante() = idiomas.size() > 1
  method sirveParaBroncearse() = true
  method dias()
}

class ViajeDePlaya inherits Actividad {
  const largo

  method implicaEsfuerzo() = largo > 1200
  override method dias() = largo / 500
}

class ExcursionACiudad inherits Actividad {
  var property cantidadDeAtracciones
  override method dias() = cantidadDeAtracciones / 2
  method implicaEsfuerzo() = cantidadDeAtracciones.between(5,8)
  override method sirveParaBroncearse() = false
  override method esInteresante() = super() || cantidadDeAtracciones == 5
}

class ExcursionTropical inherits ExcursionACiudad {
  override method dias() = super() + 1
  override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Actividad {
  const kmDeSenderos
  const diasDeSolAlAnio

  override method dias() = kmDeSenderos / 50
  method implicaEsfuerzo() = kmDeSenderos > 80
  override method sirveParaBroncearse() { return
    diasDeSolAlAnio > 200 || (diasDeSolAlAnio.between(100,200) && kmDeSenderos > 120)
  }
  override method esInteresante() = super() && diasDeSolAlAnio > 140
}

class ClaseDeGimnasia inherits Actividad {

  method initialize() {
    idiomas.clear()
    idiomas.add("español")
      if(idiomas!=["español"]) self.error("solo se permite clase de gimnasia en español")
  }
  override method dias() = 1
  method implicaEsfuerzo() = true
  override method sirveParaBroncearse() = false
}

class Socio {
  const actividades = []
  const maximoActividades
  var edad
  const property idiomas = #{}

  method esAdoradorDelSol() = actividades.all{a=>a.sirveParaBroncearse()}
  method actividadesEsforzadas() = actividades.filter{a=>a.implicaEsfuerzo()}
  method registrarActividad(unaActividad) {
    if(maximoActividades==actividades.size()) self.error("Alcanzó el máximo de actividades")
    actividades.add(unaActividad)
  }
  method leAtrae(unaActividad)
}

class SocioTranquilo inherits Socio {
  override method leAtrae(unaActividad) = unaActividad.dias() >= 4
}

class SocioCoherente inherits Socio {
  override method leAtrae(unaActividad) {return
    if(self.esAdoradorDelSol()) {unaActividad.sirveParaBroncearse()}
    else {unaActividad.implicaEsfuerzo()}
  } 
}

class SocioRelajado inherits Socio {
  override method leAtrae(unaActividad) {return
     !idiomas.intersection(unaActividad.idiomas()).isEmpty()
  }
}