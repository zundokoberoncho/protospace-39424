class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end

  def user_params
    params.require(:user).permit(:email, :password, :profile, :affiliation, :position) 
  end
end
