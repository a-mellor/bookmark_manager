feature 'creating links' do
  scenario 'users can enter new links and titles' do
    visit '/links/new'
    fill_in('Title', with: 'BBC')
    fill_in('URL', with: 'http://www.bbc.co.uk')
    click_button('Save')
    expect(page).to have_content('BBC')
  end
end
