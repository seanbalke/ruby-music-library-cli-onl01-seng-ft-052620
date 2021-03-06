class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir[path + "/*mp3"].map { |mp3| mp3.delete_prefix(path + "/") }
    end
    
    def import
        # binding.pry
        files.each { |file| Song.create_from_filename(file) }
    end

end