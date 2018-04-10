feature 'It should display our hardcoded links' do
  scenario 'We visit the homepage and see our bookmarks' do
    visit('/')
    expect(page).to have_content 'http://makersacademy.com'
  end

  scenario 'We visit the homepage and see our bookmarks' do
    visit('/add_bookmarks')
    fill_in 'url' with: 'http://mylittlepony.com'
    click_button 'Submit'
    visit('/')
    expect(page).to have_content 'http://mylittlepony.com'
  end
  
end
