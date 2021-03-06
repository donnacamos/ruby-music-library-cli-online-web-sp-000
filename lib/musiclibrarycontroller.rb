require 'pry' 

class MusicLibraryController 
  
 def initialize(path = "./db/mp3")
   MusicImporter.new(path).import 
 end 
 
 def call 
   input = "" 
   input == until input = "exit" 
   puts "Please enter action" 
   input = gets.chomp 
   case input 
   when "list songs" 
     list_songs 
   when "list artists" 
     list_artists 
   when "list genres" 
     list_genres 
   when "play song" 
     play_song 
   when "list artist" 
     list_artist 
   when "list genre" 
     list_genre 
   when "exit" 
     puts "Goodbye" 
   else 
     puts "invalid action" 
   end 
 end 
 end 
 
 def list_songs 
   Song.all.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"} 
 end 
 
 def list_artists 
   Artist.all.each {|artist| puts artist.name} 
 end 
 
 def list_genres 
   Genre.all.each {|genre| puts genre.name} 
 end 
 
 def play_song
   song = Song.all[gets.to_i - 1] 
   puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}" 
 end 
 
 def list_artist 
   puts "Enter artist" 
   specific_artist = gets.chomp 
   if Artist.find_by_name(specific_artist) != nil 
     Artist.find_by_name(specific_artist).song.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" 
   else 
     puts "Artist does not exist" 
   end 
 end 
 
 def list_genre 
   puts "Enter genre" 
   specific_genre = gets.chomp 
   if Genre.find_by_name(specific_genre) != nil 
     Genre.find_by_name(specific_genre).song.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" 
   else 
     puts "Genre does not exist" 
   end 
 end 
 end 
 
    
  
  