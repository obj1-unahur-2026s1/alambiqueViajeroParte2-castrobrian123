import paises.*
import vehiculos.*
object inscripciones {

    var ciudad = hurlingham

    const inscriptos = #{}

    const rechazados = #{}


    method anotar(vehiculo) {

        if (vehiculo.puedeLlegar(ciudad)) {
            inscriptos.add(vehiculo)
        } else {
            rechazados.add(vehiculo)
        }

    }

    method cambiarCiudad(nuevaCiudad) {

        ciudad = nuevaCiudad

        rechazados.addAll(inscriptos)

        inscriptos.clear()

        inscriptos.addAll(

            rechazados.filter({
                a => a.puedeLlegar(nuevaCiudad)
            })

        )

        rechazados.removeAll(inscriptos)

    }

    method irALaCarrera() {

        return inscriptos.forEach({
            a => a.desgaste()
        })

    }

    method ganador() {
        
        return inscriptos.max({
            a => a.velocidad()
        })

    }

}