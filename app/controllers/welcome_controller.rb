class WelcomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # if user_signed_in?
    #   redirect_to new_user_session_url
    # else
    #   redirect_to new_user_session
    # end
  end
end
