require 'rails_helper'

feature 'like images' do
  before do
    pic = Image.create(name: 'Sunny day')
    pic.comments.create(comments: 'It was lovely out')
  end

  scenario 'a user can like an image, which updates the image like count' do
    sign_up
    click_link 'like'
    redirect_to '/images'
    expect(page).to have_content('1 like')
  end


end
