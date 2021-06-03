# users_controller.rb
class UsersController < ApplicationController
  has_many :todos
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    user = User.create!(name: params[:name], email: params[:email], password: params[:password])
    response_text = "New user is created with the id #{user.id}"
    render plain: response_text
  end

  def login
    user = User.find_by(email: params[:email])
    # If the record is not found or password doesn't match it will render false else it will render true.
    render plain: ((!user.nil?) && (user.password == params[:password])) ? "True" : "False"
  end
end
