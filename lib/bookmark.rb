require 'pg'
require_relative '../local.rb'
require 'uri'

ENV['DATABASE'] = 'bookmark_manager'

class Bookmark

  def self.connection
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
  end

  def self.all
    rs = connection.exec "SELECT * FROM bookmarks"
    @list = []
    rs.each do |row|
      @list << "%s %s" % [ row['id'], row['url'] ]
    end
    @list
  end

  def self.add(params)
    return false unless is_url?(params[:url])
      connection.exec "INSERT INTO bookmarks(id, url) VALUES('#{params[:id]}', '#{params[:url]}')"
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
