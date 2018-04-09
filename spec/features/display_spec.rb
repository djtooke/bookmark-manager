feature 'It should display our hardcoded links' do
  scenario 'We visit the homepage and see our bookmarks' do
    visit('/')
    expect(page).to have_content 'http://makersacademy.com'
  end
end
