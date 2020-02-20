//Declaración de variables (inferencia)
var x = "0.0"
var y: Int = 0
let array = [1,2,3,4]

//Declaración de variables (sin inferencia)
/*var x: String
var y: Int
var array: [Int]*/


//Recorriendo arreglo
for number in array {
    print(number)
}

//Recorriendo arreglo con index
for i in 0..<array.count {
    print(array[i])
}

//Función con parametros sin retorno
func suma(primerNumero: Int, segundoNumero: Int) {
    print("La suma es: \(primerNumero + segundoNumero)")
}

suma(primerNumero: 10, segundoNumero: 10)

//Función con parametros y retorno
func sumaRetorno(primerNumero: Int, segundoNumero: Int) -> Int {
    return primerNumero + segundoNumero
}

print(sumaRetorno(primerNumero: 10, segundoNumero: 20)) //Imprime el número retornado
/*personas.append(persona)
personas.sort(by: {$0.nombre < $1.nombre})
personas.sort { (persona1, person2) -> Bool in
    return persona1.nombre < person2.nombre
}*/

class Album {
    // Varibales son públicas hasta que se indique lo contrario
    private var _nombre: String
    private var _canciones: [Cancion]
    
    init(nombre: String) { // Constructor
        _nombre = nombre
        _canciones = []
    }
    
    var nombre: String {
        set { _nombre = newValue    }
        get { return _nombre        }
    }
    
    var canciones: [Cancion] { return _canciones }
    
    func agrega(cancion: Cancion) {
        _canciones.append(cancion)
    }
}


class Cancion {
    private var _nombre: String
    private var _duracion: Int
    
    init(nombre: String, duracion: Int) {
        _nombre = nombre
        _duracion = duracion
    }
    
    var nombre: String { //variable setter y getter
        set { _nombre = newValue}
        get { return _nombre }
    }
    
    var duracion: Int { return _duracion } //variable solo getter
    
}

class Artista {
    private var _albums: [Album]
    private var _nombre: String
    
    init(nombre: String, albums: [Album]) {
        _nombre = nombre
        _albums = albums
    }
    
    init(nombre: String) {
        _nombre = nombre
        _albums = []
    }
    
    var nombre: String {
        set { _nombre = newValue    }
        get { return _nombre        }
    }
    
    func agrega(album: Album) {
        _albums.append(album)
    }
    
    var albums: [Album] { return _albums }
}

var cancion = Cancion(nombre: "Cancion", duracion: 50) // Creando un objeto canción
var albums: [Album] = [] // Creando un arreglo de albumes vacío
var album = Album(nombre: "Album") // Creando un objeto álbum
album.agrega(cancion: cancion) // Agregando una canción al álbum
albums.append(album) // Agregando un álbum al arreglo de albumes
var artista = Artista(nombre: "Artista", albums: albums) // Creando un objeto artista
artista.agrega(album: album) // Agregando un album al artista
print(artista.nombre) // Imprimiendo el nombre del artista
for album in artista.albums { // Iterando sobre cada uno de los albumes del artista
    print(album.nombre) // Imprimiendo el nombre de cada uno de los albumes
    for cancion in album.canciones { // Iterando sobre cada una de las canciones del album
        print(cancion.nombre) // Imprimiendo cada uno de los nombres de las canciones
    }
}
