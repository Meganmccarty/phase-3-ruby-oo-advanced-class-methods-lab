require 'pry'
class Song
    attr_accessor :name, :artist_name

    @@all = []

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.create
        song = self.new
        song.save
        song
    end

    def self.new_by_name(name)
        song = self.new
        song.name = name
        song
    end

    def self.create_by_name(name)
        song = self.create
        song.name = name
        song
    end

    def self.find_by_name(name)
        self.all.find { |song| song.name == name }
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create_by_name(name)
    end

    def self.alphabetical
        self.all.sort_by { |song| song.name }
    end

    def self.new_from_filename(filename)
        filename_split = filename.split(" - ")
        artist = filename_split[0]
        song_split = filename_split[1].split(".")
        song_name = song_split[0]

        song = self.new
        song.name = song_name
        song.artist_name = artist
        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
        song
    end

    def self.destroy_all
        self.all.clear
    end

end

new_song = Song.new_from_filename("Thundercat - For Love I Come.mp3")

binding.pry