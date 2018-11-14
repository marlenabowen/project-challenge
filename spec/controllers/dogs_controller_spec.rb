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
end
