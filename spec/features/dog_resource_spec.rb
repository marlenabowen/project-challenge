require 'rails_helper'

describe 'Dog resource', type: :feature do
  let(:user) { create(:user) }

  it 'can create a profile' do
    sign_in user
    visit new_dog_path
    fill_in 'Name', with: 'Speck'
    fill_in 'Description', with: 'Just a dog'
    attach_file 'Image', 'spec/fixtures/images/speck.jpg'
    click_button 'Create Dog'
    expect(Dog.count).to eq(1)
  end

  context 'for an existing dog' do
    context 'if current user is the dog owner' do
      it 'can edit the dog profile' do
        sign_in user
        dog = create(:dog, user: user)
        visit edit_dog_path(dog)
        fill_in 'Name', with: 'Speck'
        click_button 'Update Dog'
        expect(dog.reload.name).to eq('Speck')
      end

      it 'can delete the dog profile' do
        sign_in user
        dog = create(:dog, user: user)
        visit dog_path(dog)
        click_link "Delete #{dog.name}'s Profile"
        expect(Dog.count).to eq(0)
      end
    end

    context 'if current user is not the dog owner' do
      it 'can not edit the dog profile' do
        dog = create(:dog, user: user)
        visit dog_path(dog)
        expect(page).to have_no_link("Edit #{dog.name}'s Profile")
      end

      it 'can not delete the dog profile' do
        dog = create(:dog, user: user)
        visit dog_path(dog)
        expect(page).to have_no_link("Delete #{dog.name}'s Profile")
      end
    end
  end
end
