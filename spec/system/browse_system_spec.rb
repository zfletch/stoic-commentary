require 'rails_helper'

RSpec.describe 'Browse', type: :system do
  it 'shows me the front page' do
    visit '/'

    expect(page).to have_text("The Stoic Online Interactive Commentary of Epictetus' Enchiridion.")
  end

  it 'shows me the about page' do
    visit '/'

    click_link('About')

    expect(page).to have_text('About StOIC')
  end

  it 'shows the Greek text and comments when I browse' do
    visit '/'

    click_link('Browse')

    expect(page).to have_text("τῶν ὄντων τὰ μέν ἐστιν ἐφ' ἡμῖν, τὰ δὲ οὐκ ἐφ' ἡμῖν.")
    expect(page).to have_text('No comments.')
  end

  it 'allows me to navigate sections' do
    visit '/'

    click_link('Browse')

    click_link('Next ›')
    expect(page).to have_text('Reference 1.2')

    click_link('‹ Back')
    expect(page).to have_text('Reference 1.1')

    click_link('Last »')
    expect(page).to have_text('Reference 10.1')

    click_link('« First')
    expect(page).to have_text('Reference 1.1')
  end

  it 'links to edition information' do
    visit '/'

    click_link('Browse')

    click_link('Learn more')

    expect(page).to have_text('Greek')
    expect(page).to have_text('Epicteti Dissertationes ab Arriano digestae.')
  end
end
