require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    it 'should successfully create user' do
      post :create, user: { email: 'dave@mailinator.com',
                            password: 'p@ssw0rd',
                            password_confirmation: 'p@ssw0rd' }
      expect(User.first.email).to eq('dave@mailinator.com')
    end

    it 'sould not create user via invalid passwords' do
      post :create, user: { email: 'dave@mailinator.com',
                            password: 'p@ssw0r',
                            password_confirmation: 'p@ssw0rd' }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #new' do
    it 'sould success render signup page' do
      get :new

      expect(response).to render_template(:new)
    end
  end
end
