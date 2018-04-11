feature 'Should be able to add a bookmark' do
  scenario 'Submission box should accept url and add it to list' do
    visit('/add_bookmark')
    fill_in('id', :with => '3' )
    fill_in('url', :with => 'http://mylittlepony.com' )
    click_button 'Submit'
    visit('/')
    expect(page).to have_content '3 http://mylittlepony.com'
  end
end

feature 'Should not accept an invalid URL' do
  scenario 'Invalid URL is not added to list of bookmarks' do
    visit('/add_bookmark')
    fill_in('id', :with => '3' )
    fill_in('url', :with => 'NOT A URL' )
    click_button 'Submit'
    visit('/')
    expect(page).not_to have_content 'NOT A URL'
  end

  scenario 'Should give an error message telling the user the URL was invalid' do
    visit('/add_bookmark')
    fill_in('id', :with => '3' )
    fill_in('url', :with => 'NOT A URL' )
    click_button 'Submit'
    expect(page).to have_content 'NOT A URL is not a valid URL'
  end
end
