feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching confirmation password' do
  	expect {sign_up(password_confirmation: 'wrong')}.not_to change(User,:count)
  end

  scenario 'can\'t sign up without entering an email address' do
    expect { sign_up(email: '') }.not_to change(User, :count)
  end

  scenario 'can\'t sign up with an invalid formatted email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end

  scenario 'can not sign up with an already registered email address' do
    sign_up
    expect { sign_up }.not_to change(User, :count)  
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email is already taken')
  end
end
