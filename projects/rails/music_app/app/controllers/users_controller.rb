class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
