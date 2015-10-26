require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    @user = User.create!(
      email: 'dave@mailinator.com',
      password: 'p@ssw0rd',
      password_confirmation: 'p@ssw0rd'
    )
  end

  describe 'GET #new' do
    it 'should render login page' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'should creare new user session and redirect to root' do
      post :create, email: 'dave@mailinator.com', password: 'p@ssw0rd'

      expect(controller.session[:current_user_id]).to be(@user.id)
      expect(response).to redirect_to(root_path)
    end

    it 'should not create user session if wrong password' do
      post :create, email: 'dave@mailinator.com', password: 'p@ssw0rd1'

      expect(controller.session[:current_user_id]).to be(nil)
      expect(response).to render_template(:new)
      expect(controller.flash[:error]).to eq('You entered wrong password or email')
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy session' do
      controller.session[:current_user_id] = @user.id
      delete :destroy

      expect(controller.session[:current_user_id]).to be(nil)
    end
  end
end
