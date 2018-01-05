class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
      @users = User.all
      @students = @users.select { |user| user.admin == false }
      @user_only = User.all.order(params[:id])        
  end

  def toggle_admin
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    redirect_to users_url
  end
end
