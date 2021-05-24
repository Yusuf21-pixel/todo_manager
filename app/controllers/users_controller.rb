# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    user = User.create!(name: params[:name], email: params[:email], password: params[:password])
    response_text = "New user is created with the id #{user.id}"
    render plain: response_text
  end
end
