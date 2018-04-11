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
