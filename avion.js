class Avion{
    constructor (modelo,marca,peso){
        this.modelo = modelo;
        this.marca = marca;
        this.motores = true;
        this.encendido = true;
        this.gasolina = true;
        this.peso = peso
    }
    prenderMotores(){
        if(this.motores == true){
            return("Los motores del avion estan encendidos");
        } else{
            return("Los motores estan apagados,no puede arrancar");
        }
    }
    Arrancar(){
        if(this.encendido == true){
            return"listos para arrancar"
        } else{
            return"No estamos listos para arrancar"
        }
    }
}

class AvionComercial extends Avion{
    constructor(modelo,marca,peso,cantidadPasajeros){
        super(modelo,marca,peso)
        this.cantidadPasajeros = cantidadPasajeros
    }
    pasajeros(){
        if(this.cantidadPasajeros >= 200){
            return`la cantidad maxima que lleva este avion es de ${this.cantidadPasajeros}`;
        }
    }
    proposito(){
        return"Diseñado para transporte de pasajeros y carga";
    }
}

class AvionMilitar extends Avion{
    constructor(modelo,marca,peso){
        super(modelo,marca,peso)
        this.motoresExtra = true
    }
    batallaMilitar(){
        if(this.motoresExtra == true){
            return "Estamos en batalla, los motores extras estan prendidos";
        } else{
            return "¡Peligro! podemos caer sin los motores extra";
        }
    }
    proposito(){
        return "Diseñado para operaciones y combate militar";
    }
}

class Avioneta extends Avion{
    constructor(modelo,marca,peso){
        super(modelo,marca,peso);
    }
    proposito(){
        return "Sirvo para entrenamiento de vuelo y fumigaciones";
    }
}

const avionComercial1 = new AvionComercial("F-16","Boeing","41.000 kg",200);
const avionmilitar1 = new AvionMilitar("Falcon","General-dinamic","20.000 kg");
const avioneta1 = new Avioneta("Cessna 17","Cessna","450kg");

console.log(avionComercial1);
console.log(avionComercial1.pasajeros());
console.log(avionComercial1.proposito());
console.log("--------------------------");

console.log(avionmilitar1);
console.log(avionmilitar1.batallaMilitar());
console.log(avionmilitar1.proposito());
console.log("--------------------------");

console.log(avioneta1);
console.log(avioneta1.proposito());
