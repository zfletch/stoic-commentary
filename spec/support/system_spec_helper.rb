module SystemSpecHelper
  def sign_in(user = nil, email: user.email, password: 'p@ssw0rd')
    click_link 'Sign in'

    fill_in 'Email address', with: email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end
end

RSpec.configure do |config|
  config.include SystemSpecHelper, type: :system
end
