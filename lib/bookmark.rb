require 'pg'
require_relative '../local.rb'

ENV['DATABASE'] = 'bookmark_manager'

class Bookmark

  def self.connection
    con = PG.connect :dbname => ENV['DATABASE'], :user => USER
  end

  def self.all

    begin

      rs = connection.exec "SELECT * FROM bookmarks"

      @list = []

      rs.each do |row|
        @list << "%s %s" % [ row['id'], row['url'] ]
      end

      @list

    # rescue PG::Error => e
    #
    #     puts e.message
    #
    # ensure
    #
    #     rs.clear if rs
    #     con.close if con

    end

  end

  def self.add(params)
    connection.exec "INSERT INTO bookmarks(id, url) VALUES('#{params[:id]}', '#{params[:url]}')"
  end

end
