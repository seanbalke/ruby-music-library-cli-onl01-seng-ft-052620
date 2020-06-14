class Genre

    extend Concerns::Findable
    attr_accessor :name, :songs, :artists

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        # binding.pry
    end

    def songs
        @songs
    end

    def self.all
        @@all
    end
 
    def self.destroy_all
        @@all.clear
    end

    def artists
        @artists = self.songs.collect { |song|
            song.artist
        }
        @artists.uniq
    end

    def save
        @@all << self
    end

    def self.create(genre)
        created_genre = Genre.new(genre)
        created_genre.save
        created_genre
    end
    # binding.pry
    
end