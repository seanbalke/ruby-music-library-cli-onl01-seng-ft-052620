class MusicLibraryController

    def initialize(path="./db/mp3s")
        importer = MusicImporter.new(path)
        importer.import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        user_input = gets.chomp

        if user_input == "list songs"
            list_songs
        elsif user_input == "list artists"
            list_artists
        elsif user_input == "list genres"
            list_genres
        elsif user_input == "list artist"
            list_songs_by_artist
        elsif user_input == "list genre"
            list_songs_by_genre
        elsif user_input == "play song"
            play_song
        end

        unless user_input == "exit"
            call
        end
    end

    def list_artists
        alpha = Artist.all.sort {|a, b| a.name <=> b.name}.uniq
        alpha.each_with_index do |artist, index|
            puts "#{index+1}. #{artist.name}"
        end 
    end
    
    def list_genres
        alpha = Genre.all.sort {|a, b| a.name <=> b.name}.uniq
        alpha.each_with_index do |genre, index|
            puts "#{index+1}. #{genre.name}"
        end 
    end
    
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.chomp
        alpha = Artist.find_by_name(user_input)
        unless alpha == nil
            alpha_sort = alpha.songs.sort {|a, b| a.name <=> b.name}.uniq
            alpha_sort.each_with_index do |song, index|
                puts "#{index+1}. #{song.name} - #{song.genre.name}"
            end
        end
    end
    
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets.chomp
        alpha = Genre.find_by_name(user_input)
        unless alpha == nil
            alpha_sort = alpha.songs.sort {|a, b| a.name <=> b.name}.uniq
            alpha_sort.each_with_index do |song, index|
                puts "#{index+1}. #{song.artist.name} - #{song.name}"
            end
        end
    end
    
    def list_songs
        alpha = Song.all.sort {|a, b| a.name <=> b.name}.uniq
        alpha.each_with_index do |song, index|
            puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end 
    end 
    
    def play_song
        # binding.pry
        puts "Which song number would you like to play?"
        user_input = gets.chomp.to_i
        if user_input > 0 && user_input <= 5
            alpha = Song.all.sort {|a, b| a.name <=> b.name}.uniq
            puts "Playing #{alpha[user_input-1].name} by #{alpha[user_input-1].artist.name}"
        end

    end
    
end