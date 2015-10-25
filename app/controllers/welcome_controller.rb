class WelcomeController < SessionsController
  before_action :chek_authenticate

  def index
  end
end
