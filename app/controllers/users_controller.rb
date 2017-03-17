class UsersController < ApplicationController
  def login
    @user = User.new
  end

  def login_user
    @user = User.where("email=? AND password=?", params[:email], params[:password])

    if @user.empty?
      flash[:errors] = "Email and password do not match."
      redirect_to users_login_path
    else
      session[:id] = @user[0].id
      session[:name] = @user[0].name
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully registered."
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_login_path
    end
  end

  def destroy
    session.clear
    redirect_to users_login_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
