require 'bookmark'

describe Bookmark do
  it 'should have a class method to retreive all bookmarks' do
    expect(Bookmark.all('bookmark_manager_test')).to include("4 http://google.com")
  end


end
