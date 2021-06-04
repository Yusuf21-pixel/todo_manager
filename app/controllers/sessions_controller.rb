class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "Logged In"
    else
      render plain: "Incorrect password or email"
    end
  end
end
