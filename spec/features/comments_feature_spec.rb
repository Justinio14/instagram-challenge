require 'rails_helper'

feature 'reviewing' do
  before { Image.create name: 'Sunny day' }

  scenario 'allows user to leave a review' do
    visit '/images'
    click_link 'Review Sunny day'
    fill_in 'Comments', with: "looks nice"
    click_button 'Leave Comment'

    expect(current_path).to eq '/images'
    click_link 'KFC'
    expect(page).to have_content('looks nice')
  end
end
