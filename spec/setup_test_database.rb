require 'bookmark'

def reset_and_fill
  Bookmark.connection.exec "TRUNCATE bookmarks"
  Bookmark.add({id: 1, url: 'http://google.com', title: 'Google'})
  Bookmark.add({id: 2, url: 'http://makersacademy.com', title: 'Makers Academy'})
end
