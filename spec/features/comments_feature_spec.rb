require 'rails_helper'

feature 'reviewing' do
  before { Image.create name: 'Sunny day' }

  scenario 'allows user to leave a review' do
    sign_up
    visit '/images'
    click_link 'Leave Comment'
    fill_in 'Comments', with: "looks nice"
    click_button 'Post Comment'

    expect(current_path).to eq '/images'
    click_link 'View image'
    expect(page).to have_content('looks nice')
  end
end
