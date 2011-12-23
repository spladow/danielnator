require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'instagram'

Instagram.configure do |config|
  config.client_id = a64b89067a104af08b70d6bcd242de22
end

get '/instagram' do 
	instagram = Instagram.user_recent_media("spladow")
	
	pp instagram
	
	puts instagram
	
end