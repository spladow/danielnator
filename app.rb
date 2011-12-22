require 'rubygems'
require 'sinatra'
require 'twitter'

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

get '/faves' do
	favorites = Twitter.user("spladow").favorited?
	"These are Thomas' favorite tweets #{favorites}"
end


get '/' do
	erb :index
end