require 'bookmark'

describe Bookmark do
  it 'should have a class method to retreive all bookmarks' do
    bookmark1 = Bookmark.new
    bookmark2 = Bookmark.new
    bookmark1.add
    bookmark2.add
    expect(Bookmark.all).to eq([bookmark1, bookmark2])
  end


end
