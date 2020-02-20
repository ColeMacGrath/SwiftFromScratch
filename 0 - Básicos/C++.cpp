#include <iostream>
#include <vector>
using namespace std;

class Cancion {
    string nombre;
    int duracion;
public:
    Cancion(string nombre, int duracion) {
        this->nombre = nombre;
        this->duracion = duracion;
    }
    
    void setNombre(string nombre) { this->nombre = nombre;  }
    string getNombre()            { return this->nombre;    }
    int getDuracion()             { return this->duracion;  }
};

class Album {
    string nombre;
    vector<Cancion> canciones;
public:
    Album(string nombre) {
        this->nombre = nombre;
    }
    
    void setNombre(string nombre) { this->nombre = nombre;  }
    string getNombre()            { return this->nombre;    }
    vector<Cancion> getCanciones(){ return this->canciones; }
    
    void agregaCancion(Cancion cancion) {
        this->canciones.push_back(cancion);
    }
};

class Artista {
    vector<Album> albums;
    string nombre;
public:
    Artista(string nombre, vector<Album> albums) {
        this->nombre = nombre;
        this->albums = albums;
    }
    
    Artista(string nombre) {
        this->nombre = nombre;
    }
    
    string getNombre()            { return this->nombre;    }
    void setNombre(string nombre) { this->nombre = nombre;  }
    vector<Album> getAlbums()     { return this->albums;    }
    
    void agregaAlbum(Album album) {
        this->albums.push_back(album);
    }
};


void suma(int primerNumero, int segundoNumero);
int sumaRetorno(int primerNumero, int segundoNumero);

int main(int argc, const char * argv[]) {
    //Declaración de variables (inferencia)
    auto x = "0.0";
    auto y = 0;
    
    //Declaración de variables (sin inferencia)
    //string x;
    //int y;
    vector<int> array = {1,2,3,4};
    
    //Recorriendo arreglo
    for(int number : array) {
        cout<<number<<endl;
    }
    
    //Recorriendo arreglo con index
    for(int i=0; i<array.size(); i++) {
        cout<<array[i]<<endl;
    }
    
    suma(10, 10);
    
    cout<<sumaRetorno(10, 10)<<endl;
    
    Cancion cancion("Cancion", 50); // Creando un objeto canción
    vector<Album> albums; // Creando un arreglo de albumes vacío
    Album album("Album"); // Creando un objeto álbum
    album.agregaCancion(cancion); // Agregando una canción al álbum
    albums.push_back(album); // Agregando un álbum al arreglo de albumes
    Artista artista("Artista", albums); // Creando un objeto artista
    artista.agregaAlbum(album); // Agregando un album al artista
    
    cout<<artista.getNombre()<<endl; // Imprimiendo el nombre del artista
    //for(Album album : artista.getAlbums()) // También válido para iterar sobre objetos
    for(auto &&album : artista.getAlbums()) { // Iterando sobre cada uno de los albumes del artista
        cout<<album.getNombre()<<endl; // Imprimiendo el nombre de cada uno de los albumes
        for(auto &&cancion : album.getCanciones()) { // Iterando sobre cada una de las canciones del album
            cout<<cancion.getNombre()<<endl; // Imprimiendo cada uno de los nombres de las canciones
        }
    }
    
    return 0;
}

//Función con parametros sin retorno
void suma(int primerNumero, int segundoNumero) {
    cout<<"La suma es: "<<primerNumero + segundoNumero<<endl;
}

//Función con parametros y retorno
int sumaRetorno(int primerNumero, int segundoNumero) {
    return primerNumero + segundoNumero;
}
