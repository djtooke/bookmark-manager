require 'bookmark'

describe Bookmark do
  it 'should have a class method to retreive bookmarks from the database' do
    expect(Bookmark.all[1].title).to eq("Makers Academy")
  end


end
