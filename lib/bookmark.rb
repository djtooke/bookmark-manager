require 'pg'
require_relative '../local.rb'

class Bookmark

  def self.all

    begin

        con = PG.connect :dbname => 'bookmark_manager', :user => USER

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

end
