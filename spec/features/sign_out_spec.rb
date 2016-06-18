feature 'User can sign out' do

  before(:each) do
    User.create(email: 'peachymcpeachface@peaches.com',
                password: 'plums',
                password_confirmation: 'plums')
  end

  scenario 'while being signed in' do
    sign_in(email: 'peachymcpeachface@peaches.com', password: 'plums')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye')
    expect(page).not_to have_content ('Welcome, peachymcpeachface@peaches.com')
  end
end
