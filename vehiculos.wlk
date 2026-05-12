

object alambiqueVeloz {

    var rapido = true

    var combustible = 20

    const consumoPorViaje = 10

    var patente = "AB123JK"

    method velocidad() = 10

    method puedeFuncionar() = combustible >= consumoPorViaje

    method desgaste() {
        combustible = combustible - consumoPorViaje
    }

    method rapido() = rapido

    method patenteValida() = patente.take(1) == "A"

}

object antigualla {

    var gangsters = 7

    method velocidad() = 30

    method puedeFuncionar() = gangsters.even()

    method rapido() = gangsters > 6

    method desgaste(){
        gangsters = gangsters -1
    }

    method patenteValida() = chatarra.rapido() 

}

object chatarra {

    var cañones = 10

    var municiones = "ACME"

    method velocidad() = 5

    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)

    method rapido() = municiones.size() < cañones

    method desgaste(){

        cañones = (cañones / 2).roundUp(0)

        if (cañones < 5 ){
            municiones = municiones + " Obsoleto"
        }

    }

    method patenteValida() = municiones.take(4) == "ACME"

    method cañones() = cañones

}

object convertible{

    var convertido = antigualla

    method velocidad() = 40

    method puedeFuncionar() = convertido.puedeFuncionar()

    method rapido() = convertido.rapido()

    method desgaste(){
        convertido.desgaste()
    }

    method convertir(vehiculo){
        convertido = vehiculo
    }

    method patenteValida() = convertido.patenteValida()
 
}

object moto{

    method velocidad() = 50

    method rapido() = true

    method puedeFuncionar() = not self.rapido()

    method desgaste() { }

    method patenteValida() = false

}

object antiguallaBlindada {

    const gangsters = ["Juan Triste", "Juan Inalambrico", "Juan Chernobyl", "Juan Callejero", "Juan", "Juan Programador", "Juan Artista" ]

    method puedeFuncionar() = gangsters.even()

    method rapido() = gangsters > 6

    method desgaste() {
        gangsters.remove(gangsters.anyOne())
    }

    method velocidad() {

        return gangsters.sum({
            g => g.size()
        })
        
    }
}

object pierreyPatan {

    var baseTiempo = 80

    method puedeFuncionar() = true

    method rapido() = true

    method desgaste() { }

    method patenteValida() = true

    method tiempoDeCarrera(ciudad) = baseTiempo + 20 
}

object profesorLocovich {

    var formas = [alambiqueVeloz, chatarra, moto]

    var actual = alambiqueVeloz

    method convertir() {
        actual = formas.removeFirst()
        formas.add(actual)
    }

    method puedeFuncionar() = actual.puedeFuncionar()

    method rapido() = actual.rapido()

    method desgaste() {
        actual.desgaste()
    }

    method patenteValida() = actual.patenteValida()

    method tiempoDeCarrera(ciudad) = actual.tiempoDeCarrera(ciudad)

}