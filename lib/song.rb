class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist
        self.genre = genre
    end

    def self.new_from_filename(filename)
        file = filename.split(" - ")
        song = Song.find_or_create_by_name(file[1])
        song.artist = Artist.find_or_create_by_name(file[0])
        song.genre = Genre.find_or_create_by_name(file[2].chomp(".mp3"))
        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        @@all << song
    end

    def self.find_by_name(name)
       #find a song instance in @@all (self.all) by name
       self.all.detect{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name) == nil
            self.create(name)
        else
            self.find_by_name(name)
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def artist=(name)
        @artist = name
        @artist.add_song(self) unless name == nil
    end

    def genre
        @genre
    end

    def genre=(genre)
        @genre = genre
        if genre != nil
            genre.songs << self unless genre.songs.include? self
        end
    end

    def save
        @@all << self
    end

    def self.create(name)
        created_song = Song.new(name)
        created_song.save
        created_song
    end
    # binding.pry
    
end