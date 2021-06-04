# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render "new"
  end

  def create
    User.create!(first_name: params[:first_name],
                 last_name: params[:last_name],
                 email: params[:email],
                 password: params[:password])
    redirect_to "/"
  end

  def login
    user = User.find_by(email: params[:email])
    # If the record is not found or password doesn't match it will render false else it will render true.
    render plain: ((!user.nil?) && (user.password == params[:password])) ? "True" : "False"
  end
end
