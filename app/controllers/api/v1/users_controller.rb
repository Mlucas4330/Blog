class Api::V1::UsersController < ApplicationController
  def sign_up
    @user = User.new(user_params)
  
    if @user.save
      render status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password)
  end
end
