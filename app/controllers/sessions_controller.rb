class SessionsController < ApplicationController

  def new
  end

  def create    
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
     # Save the user id inside the browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def delete
    session.clear
    redirect_to root_path
  end

end
