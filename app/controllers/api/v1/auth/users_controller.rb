class Api::V1::Auth::UsersController < ApplicationController
  def login
    @user = User.find_by(username: user_params[:username])

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: :ok
    else
      render json: {error: "Usuário ou senha inválidos"}, status: :unprocessable_entity
    end
  end

  def register
    @user = User.new(user_params)

    user = User.find_by(username: user_params[:username])

    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password)
  end
end
