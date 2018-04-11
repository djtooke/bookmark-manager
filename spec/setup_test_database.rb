def reset_and_fill
  begin
      con = PG.connect :dbname => ENV['DATABASE'], :user => USER
      con.exec "TRUNCATE bookmarks"
      con.exec "INSERT INTO bookmarks(id, url) VALUES('1', 'http://google.com')"
      con.exec "INSERT INTO bookmarks(id, url) VALUES('2', 'http://makersacademy.com')"

  rescue PG::Error => e
      puts e.message

  ensure
      con.close if con

  end
end
