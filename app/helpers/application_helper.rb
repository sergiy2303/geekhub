module ApplicationHelper
  def user_signed_in?
    return true if session[:current_user_id]
  end
end
