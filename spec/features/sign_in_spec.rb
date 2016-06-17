feature 'User can sign in' do
  let!(:user) do
    User.create(email: 'peachymcpeachface@peaches.com',
                password: 'plums',
                password_confirmation: 'plums')
  end

  scenario 'with correct details' do
    sign_in(email: 'peachymcpeachface@peaches.com',
            password: 'plums')
    expect(page).to have_content("Welcome, peachymcpeachface@peaches.com")
  end
end
