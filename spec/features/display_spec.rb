feature 'It should display the links in the database' do
  scenario 'We visit the homepage and see our bookmarks' do
    visit('/')
    expect(page).to have_content '1 Google'
  end

end
