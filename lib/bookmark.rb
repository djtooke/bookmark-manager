require 'pg'
require_relative '../local.rb'
require 'uri'

ENV['DATABASE'] = 'bookmark_manager'

class Bookmark

attr_reader :id, :url, :title

  def initialize(id, title, url)
    @id = id
    @url = url
    @title = title
  end

  def self.connection
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
  end

  def self.all
    rs = connection.exec "SELECT * FROM bookmarks"
    @bookmarks = rs.map do |row|
      Bookmark.new(row['id'], row['title'], row['url'])
    end
    @bookmarks
  end

  def self.add(params)
    return false unless is_url?(params[:url])
      connection.exec "INSERT INTO bookmarks(id, url, title) VALUES('#{params[:id]}', '#{params[:url]}', '#{params[:title]}')"
  end

  def self.delete(params)
    params[:delete].each do |bookmark_title|
      connection.exec("DELETE FROM bookmarks WHERE title = '#{bookmark_title}'")
    end
    p params
  end
  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
