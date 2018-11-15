require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  login_user
  let(:user) { subject.current_user }

  describe '#index' do
    it 'displays recent dogs' do
      2.times { create(:dog, user: user) }
      get :index
      expect(assigns(:dogs).size).to eq(2)
    end

    it 'paginates to display 5 dogs per page' do
      10.times { create(:dog, user: user) }
      get :index
      expect(assigns(:dogs).size).to eq(5)
    end
  end

  describe '#create' do
    it 'saves a new dog' do
      dog_params = FactoryBot.attributes_for(:dog)
      expect{
        post :create, params: { dog: dog_params }
      }.to change(Dog,:count).by(1)
    end
  end

  describe '#edit' do
    context 'if the current user is the dog owner' do
      it 'can edit the dog profile' do
        dog = create(:dog, user: user)
        get :edit, params: { id: dog.id }
        expect(response).to render_template 'dogs/edit'
      end
    end

    context 'if the current user is not the dog owner' do
      let(:second_user) { create(:user) }

      it 'can not edit the dog profile' do
        dog = create(:dog, user: second_user)
        get :edit, params: { id: dog.id }
        expect(response).not_to render_template 'dogs/edit'
      end
    end

    context 'if the user is not logged in' do
      logout_user

      it 'can not edit the dog profile' do
        dog = create(:dog, user: user)
        get :edit, params: { id: dog.id }
        expect(response).not_to render_template 'dogs/edit'
      end
    end
  end
end
