class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to puppies_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    params.require(:users).permit(:email, :password, :first_name, :last_name, :birthdate, :location)
  end
end
