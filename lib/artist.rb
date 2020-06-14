class Artist

    extend Concerns::Findable
    attr_accessor :name, :songs, :genres

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        # binding.pry
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist = self if song.artist == nil
        @songs << song unless @songs.include? song
    end

    def genres
        # iterate over all songs, find artist == self return genres
        @genres = self.songs.collect { |song|
            song.genre
        }
        @genres.uniq
    end
    
    def self.all
        @@all
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def save
        @@all << self
    end
    
    def self.create(name)
        created_artist = Artist.new(name)
        created_artist.save
        created_artist
    end
    
    # binding.pry
end