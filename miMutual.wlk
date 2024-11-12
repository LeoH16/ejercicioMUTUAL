class Viaje
{
    const property idiomas = #{}
    method diasQueLleva()


}

class ViajeDePlaya inherits Viaje
{
    const largo

    override method diasQueLleva() = largo / 500
    method implicaEsfuerzo() = largo > 1200
    method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje
{
    const cantAtracciones

    override method diasQueLleva() = cantAtracciones / 2
    method implicaEsfuerzo() = cantAtracciones.between(5, 8)
    method sirveParaBroncearse() = false
}

class ExcursionACiudadTropical inherits ExcursionACiudad
{
    override method diasQueLleva() = super() + 1
    override method sirveParaBroncearse() = true
}

class SalidaTrekking inherits Viaje
{
    const kmDeSenderos
    const diasDeSol

    override method diasQueLleva() = kmDeSenderos / 50
    method implicaEsfuerzo() = kmDeSenderos > 80
    method sirveParaBroncearse() = diasDeSol > 200 || (diasDeSol.between(100, 200) && kmDeSenderos > 120)
}