class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end

  def user_params
    params.require(:user).permit(:email, :password, :profile, :affiliation, :position) # 他のパラメータもここに追加
  end
  
end
