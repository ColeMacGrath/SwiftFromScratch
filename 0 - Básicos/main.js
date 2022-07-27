class Song {
    constructor(name, length) {
        this.name = name;
        this.length = length;
    }
}

class Album {
    constructor(name, songs) {
        
        this.name = name;
        this.songs = songs;
    }
}

class Artist {
    constructor(name, albums) {
        this.name = name;
        this.albums = albums;
    }
}

const song = new Song("Song 1", 100)

var albums = [
    new Album("Album 1", [new Song("Song 2", 90)])
]

albums.push(new Album("Album 2", [new Song("Song 3", 103), new Song("Song 4", 50)]));

const artist = new Artist("Artist", albums);

console.log(artist.name);

artist.albums.forEach(album => {
    console.log(album.name);
    album.songs.forEach(song => {
        console.log(song.name);
        console.log(song.length);
    });
});

const totalLength = album.songs.map(a => a.length).reduce((a, b) => a + b, 0);

