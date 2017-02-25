require 'rails_helper'

feature 'images' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'New Image'
    end
  end



  context 'Images have been added' do
    before do
      Image.create(name: 'Sunny day')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content('Sunny day')
      expect(page).not_to have_content('No images yet')
    end
  end
  #
  # context 'When not signed up ' do
  #   scenario 'User tries to create a restaurant' do
  #     visit '/restaurants'
  #     click_link 'Add a restaurant'
  #     expect(current_path).to eq '/users/sign_in'
  #   end
  #
      context 'an invalid image name' do
        scenario 'does not let you submit a name that is too short' do
          # sign_up
          visit '/images'
          click_link 'New Image'
          fill_in 'Name', with: 'th'
          click_button 'Create Image'
          expect(page).to have_content 'error'
        end
      end

  context 'viewing images' do
    let!(:picture) {Image.create(name:'Sunny day')}
    scenario 'lets a user view an image' do
      visit '/images'
      click_link 'Show Sunny day'
      expect(page).to have_content 'Sunny day'
      expect(current_path).to eq "/images/#{picture.id}"
    end

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/images'
      click_link 'Delete Sunny day'
      expect(page).not_to have_content 'Sunny day'
      expect(page).to have_content 'Image was successfully deleted'
    end
  end


end
