class UsersController < ApplicationController

  def show
    set_user
  end



  def set_user
   @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :Last_name, :phone_number)
  end

end
