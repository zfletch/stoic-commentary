require 'rails_helper'

RSpec.describe 'Authentication', type: :system do
  it 'allows me to sign in' do
    user = create(:user)

    visit '/'
    expect(page).to have_text('Sign in')
    expect(page).to_not have_text('Sign out')

    sign_in(user)

    visit '/'
    expect(page).to_not have_text('Sign in')
    expect(page).to have_text('Sign out')
  end

  it 'allows me to sign out' do
    visit '/'

    sign_in(create(:user))

    click_link('Sign out')

    expect(page.current_path).to eq('/')
    expect(page).to have_text('Sign in')
  end

  it 'prevents me from signing in with invalid credentials' do
    create(:user)

    visit '/'

    sign_in(email: 'not-a-user@example.com')

    expect(page).to have_text('Email or password invalid')
    expect(page).to_not have_text('Sign out')
  end

  it 'allows me to create an account' do
    visit '/'

    click_link('Sign in')
    click_link('Create new account')

    fill_in 'Email', with: 'some-user@example.com'
    fill_in 'Name', with: 'Some User'
    fill_in 'Password', with: 'secure password'
    fill_in 'Confirm password', with: 'secure password'
    click_button 'Create account'

    click_link('Sign out')

    sign_in(email: 'some-user@example.com', password: 'secure password')

    expect(page).to have_text('Sign out')
  end

  it 'allows me to edit my account' do
    visit '/'

    click_link('Sign in')
    click_link('Create new account')

    fill_in 'Email', with: 'some-user@example.com'
    fill_in 'Name', with: 'Some User'
    fill_in 'Password', with: 'secure password'
    fill_in 'Confirm password', with: 'secure password'
    click_button 'Create account'

    click_link('Account')
    fill_in 'Email', with: 'some-user-updated@example.com'
    click_button 'Update account'

    click_link('Sign out')

    sign_in(email: 'some-user-updated@example.com', password: 'secure password')

    expect(page).to have_text('Sign out')
  end

  it 'allows me to reset my password' do
    user = create(:user)

    visit '/'
    click_link('Sign in')
    click_link('Forgot password?')

    fill_in 'Email', with: user.email
    perform_enqueued_jobs { click_button 'Reset' }

    email = ActionMailer::Base.deliveries.last.html_part
    link = email.body.match(%r{<a href="http://localhost:3000(.*)">})[1]

    visit link

    expect(page).to have_text('Sign out')
  end

  it 'prevents me from visiting a page requiring authentication' do
    visit '/account/edit'

    expect(page).to have_text('Please sign in')
    expect(page.current_path).to eq('/sessions/new')
  end

  it 'prevents me from visiting the admin page as a non-admin' do
    user = create(:user)

    visit '/'

    sign_in(user)

    visit '/admin'

    expect(page).to have_text('Please sign in')
    expect(page.current_path).to eq('/')
  end

  it 'allows me to visit the admin page as an admin' do
    user = create(:user, role: :admin)

    visit '/'

    sign_in(user)

    visit '/admin'

    expect(page).to have_text('Dashboard')
    expect(page.current_path).to eq('/admin')
  end
end
