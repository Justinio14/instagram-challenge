require 'rails_helper'

feature 'images' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      sign_up
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add new Image'
    end
  end



  context 'Images have been added' do
    before do
      Image.create(name: 'Sunny day')
    end

    scenario 'display images' do
      sign_up
      visit '/images'
      expect(page).to have_content('Sunny day')
      expect(page).not_to have_content('No images yet')
    end
  end

  context 'When not signed up' do
    scenario 'User visits site and presses sign up' do
      visit '/'
      click_link 'Sign up'
      expect(current_path).to eq '/users/sign_up'
    end

      context 'an invalid image name' do
        scenario 'does not let you submit a name that is too short' do
          sign_up
          visit '/images'
          click_link 'Add new Image'
          fill_in 'Name', with: 'th'
          click_button 'Create Image'
          expect(page).to have_content 'error'
        end
      end

  context 'viewing images' do
    let!(:picture) {Image.create(name:'Sunny day')}
    scenario 'lets a user view an image' do
      sign_up
      visit '/images'
      click_link 'View'
      expect(page).to have_content 'Sunny day'
      expect(current_path).to eq "/images/#{picture.id}"
    end
  end
    scenario 'removes a restaurant when a user clicks a delete link' do
      sign_up
      click_link 'Add new Image'
      fill_in('Name', with: 'Sunny day')
      fill_in('Picture', with: 'Sunny day')
      click_button 'Create Image'
      click_link 'Delete'
      expect(page).not_to have_content 'Sunny day'
      expect(page).to have_content 'Image successfully deleted'
    end


end
end
