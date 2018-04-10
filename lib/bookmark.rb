require 'pg'
require_relative '../local.rb'

ENV['DATABASE'] = 'bookmark_manager'

class Bookmark

  def self.all

    begin

        con = PG.connect :dbname => ENV['DATABASE'], :user => USER

        rs = con.exec "SELECT * FROM bookmarks"

        @list = []

        rs.each do |row|
          @list << "%s %s" % [ row['id'], row['url'] ]
        end

        @list

    rescue PG::Error => e

        puts e.message

    ensure

        rs.clear if rs
        con.close if con

    end

  end

  def self.add(params)
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
    con.exec "INSERT INTO bookmarks(id, url) VALUES('9', '#{params[:url]}')"
  end

end
