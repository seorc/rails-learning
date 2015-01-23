class UsersController < ApplicationController

  before_action :user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:wellcome] = "You have been registered"
      redirect_to @user, notice: "Wellcome"
    else
      render :new  # Render the new template.
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to @user, notice: "Done, your profile was updated"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation)
  end

  def user
    @user = User.find params[:id]
  end
end
