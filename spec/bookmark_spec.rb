require 'bookmark'

describe Bookmark do
  it 'should have a class method to retreive all bookmarks' do
    expect(Bookmark.all).to eq(['www.google.com', 'www.makersacademy.com', 'www.mylittlepony.com'])
  end


end
