require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'twitter'
require 'pp'
require 'excon'
require 'json'

get '/thedaniel' do
	location = Twitter.user("spladow").location
	status = Twitter.user_timeline("spladow").first.text
	if status.start_with?('@')
		splitstatus = status.split
		"Thomas is talking to his friend: #{splitstatus[0]}: \"#{status}\""
	else
		"Daniel is in #{location} and he just said, \"#{status}\""
	end
end
		

get '/reply' do 
	tweets = Twitter.user_timeline("spladow")
	
	pp tweets.first

	id = tweets.first.id
	
	
	connection = Excon.new('https://api.twitter.com/1/statuses/oembed.json')
	response = connection.get(:query => {:id => id})
	parsed = JSON.parse(response.body)
	html = parsed["html"]
	html
end

get '/embed' do
	date = Twitter.user_timeline("spladow").first.created_at
	"This is the date of the most recent tweet #{date}"

end


get '/' do
	erb :index
end

# id_str give me the status id of a tweet