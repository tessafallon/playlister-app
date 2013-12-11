require 'bundler'
require 'sinatra'
Bundler.require
require './lib/artist'
require './lib/genre'
require './lib/song'
require './lib/parser'

class Catalog < Sinatra::Application
	before do parse_directory(File.join(Dir.pwd,'data'))
	end

	get '/home' do
		erb :home
	end

	get '/home/:type' do
		user_input = params[:type].to_s
		if user_input == "artist"
		artists =[]
		Artist.all.each do |o|
      	artists << "#{o.name}" 	end	
      	@list = artists
      	erb :artist
		
		elsif user_input == "genre"
			genres = []
			Genre.all.each do |o|
				genres << "#{o.name}" end
		@list = genres

		erb :genre

		else
		 user_input == "song"
		 	songs = []
		 	Song.all.each do |o|
		 		songs << "#{o.name}"end
		 @list = songs

		 erb :song
		end
	end

	get '/home/artist/:type' do
	@user_artist = params[:type]
	artist = Artist.find_by_name(@user_artist)
	@l_songs = artist.list_songs
	erb :artists_song
	end

	get '/home/genre/:type' do
	@user_genre = params[:type]
	genre = Genre.find_by_name(@user_genre)
	@l_genres = genre.list_songs
	erb :genre_song
	end
end