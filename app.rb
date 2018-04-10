require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :display
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/submit_new' do
    Bookmark.add(params)
    redirect ('/')
  end

end
