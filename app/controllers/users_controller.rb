class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    @user = User.new(user_params)
    if @user.update
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end


  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      render json: @user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
