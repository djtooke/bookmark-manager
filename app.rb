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

  post '/bookmarks/delete' do
    Bookmark.delete(params)
    p params
    redirect ('/')
  end

end
