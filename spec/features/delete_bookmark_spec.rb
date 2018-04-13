feature 'Should be able to delete a bookmark' do
  scenario 'User checks the box for the bookmark and hits delete' do
    visit('/')
    check 'Google'
    check 'Makers Academy'
    click_button 'Delete'
    expect(page).to_not have_content '1 Google'
    expect(page).to_not have_content '2 Makers Academy'
  end
end
