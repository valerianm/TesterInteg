class PagesController < ApplicationController
  def home
  end

  def club
    @users = User.all 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password])
    if @user.valid?
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to "/home"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
