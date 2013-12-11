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
		end
	end
end