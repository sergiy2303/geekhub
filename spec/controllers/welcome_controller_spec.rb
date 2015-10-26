require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  before do
    @user = User.create!(email: 'dave@mailinator.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd')
    controller.session[:current_user_id] = @user.id
  end

  describe 'GET #index' do
    it 'should success render root page' do
      get :index

      expect(response).to be_ok
    end

    it 'sould redirect to login page if user not sign in' do
      controller.session[:current_user_id] = nil
      get :index

      expect(response).to redirect_to(new_session_path)
    end
  end
end
