class RegistrationsController < ApplicationController



  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def user_params
    params.require(:user).permit(:employee_id, :full_name, :department_id, :occupation_id, :ward_id, :group_id, :email, :password, :password_confirmation)
  end














end
