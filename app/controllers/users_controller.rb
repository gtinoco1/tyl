class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update_password
    @user = current_user
    if params[:user][:password].present? && params[:user][:password_confirmation].present? && @user.update_with_password(user_params_change_password)
      bypass_sign_in(@user)
      redirect_to(root_path, :notice => "Password updated successfully")
    elsif !params[:user][:current_password].present?
      redirect_to(edit_user_path, :alert => "We require current password to update your password")
    elsif params[:user][:password] != params[:user][:password_confirmation]
      redirect_to(edit_user_path, :alert => "Password and password_confirmation should be matched")
    elsif params[:user][:current_password] != @user.password
      redirect_to(edit_user_path, :alert => "Current password is wrong")
    else
      redirect_to(edit_user_path, :alert => "Password should have atleast lenght of 6")
    end
  end

  def update_profile
    @user = User.find(current_user.id)
    @user.update_attributes(user_params) if params[:user][:headshot].present?
    if HeadshotCoordinate.find_by(user_headshot_id: @user.id).present?
      HeadshotCoordinate.find_by(user_headshot_id: @user.id).update(crop_x: params[:user][:crop_x],crop_y: params[:user][:crop_y], crop_w: params[:user][:crop_w], crop_h: params[:user][:crop_h], rotate: params[:user][:rotate])
    else
      HeadshotCoordinate.create(user_headshot_id: @user.id,crop_x: params[:user][:crop_x],crop_y: params[:user][:crop_y], crop_w: params[:user][:crop_w], crop_h: params[:user][:crop_h], rotate: params[:user][:rotate])
    end
    redirect_to user_root_path, :notice => "Profile update successfully."
  end

  def delete_profile
    @user = User.find_by(id: current_user.id)
    @user.remove_headshot = true
    @user.save
    redirect_to user_root_path, :notice => "Profile Deleted successfully."
  end

  private

  def user_params
    params.require(:user).permit(:headshot)
  end
  def user_params_change_password
   params.require(:user).permit(:current_password, :password, :password_confirmation)
 end

end
