import Foundation

//Creación de clases
class Song {
    //Declaración de propiedades
    var name: String
    var length: Int
    
    //Creación de constructor
    init(name: String, length: Int) {
        //self equivalente a this
        self.name = name
        self.length = length
    }
}

class Album {
    var name: String
    var songs: [Song] //Array<Song>, otra manera de declarar un array de objeto
    
    init(name: String, songs: [Song]) {
        self.name = name
        self.songs = songs
    }
    
    //Metodo que retorna el total de duración de las canciones
    func getTotalSongsLength() -> Int {
        //songs.map retorna un arreglo con la duración de las canciones
        //reduce hace la sumatoria del arreglo
        return (songs.map {$0.length }).reduce(0, +)
    }
}

class Artist {
    var name: String
    var albums: [Album]
    
    init(name: String, albums: [Album]) {
        self.name = name
        self.albums = albums
    }
}

//Instanciación de un nuevo objeto
let song = Song(name: "Song 1", length: 100)

//Creación de un arreglo y un objeto
var albums = [
    Album(name: "Album 1", songs: [Song(name: "Song 2", length: 90)])
]

//Se agrega al final del arreglo un nuevo album (Equivalente a push en JavaScript)
albums.append(Album(name: "Album 2", songs: [Song(name: "Song 3", length: 103), Song(name: "Song 4", length: 50)]))

let artist = Artist(name: "Artist", albums: albums)

//Se imprime una propiedad
print(artist.name)

//ForEach para todos los albumes del artista
artist.albums.forEach { album in
    print(album.name)
    album.songs.forEach { song in
        print("Camción: \(song.name) - \(song.length)")
    }
}

//Se comprueba si el album existe y no es nulo
if let album = artist.albums.last {
    print(album.getTotalSongsLength())
}

var array = [5, 4, 67, 10, 30]

//Map para la multiplicación de todos los elementos del arreglo en formato extendido

let newArray = array.map { number in
    return number * 2
}
//Map para la multiplicación de todos los elementos del arreglo en formato reducido <-- Optar por esta manera
array.map { $0 * 2 }

//Sumatoria de todos los números del arreglo
print(array.reduce(0, +))