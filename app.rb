require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmark.all
    erb :display
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/submit_new' do
    flash[:bad_url] = "#{params[:url]} is not a valid URL" unless Bookmark.add(params)
    redirect ('/')
  end

end

# get '/set_flash' do
#   flash[:blah] = "You were feeling blah at #{Time.now}."
#   redirect ('/')
# end
#
# get '/flash_test' do
#   if flash[:blah]
#     "Have you ever felt blah? Oh yes. #{flash[:blah]} Remember?"
#   else
#     "Oh, now you're only feeling bleh?"
#   end
# end
