require 'rails_helper'

RSpec.describe 'User actions', type: :system do
  it 'allows me to edit my account' do
    user = create(:user)

    visit '/'

    sign_in(user)

    click_link('Account')
    fill_in 'Email', with: 'some-user-updated@example.com'
    click_button 'Update account'

    click_link('Sign out')

    sign_in(email: 'some-user-updated@example.com')

    expect(page).to have_text('Sign out')
  end

  it 'allows me to leave a comment' do
    user = create(:user)

    visit '/'

    sign_in(user)

    click_link('Browse')

    fill_in 'Leave a comment ...', with: 'This passage is great!'
    click_button 'Submit'

    click_link('Sign out')
    click_link('Browse')

    expect(page).to have_text('This passage is great!')
  end
end
