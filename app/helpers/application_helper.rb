module ApplicationHelper

def logged_in?
    @current_user ||= User.find(session[:user_id])
end




end
