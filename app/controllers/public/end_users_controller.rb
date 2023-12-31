class Public::EndUsersController < ApplicationController
  #before_action :authenticate_end_user!

  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
    #if @end_user.id != current_end_user.id
      #redirect_to end_user_path(current_end_user)
    #end
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      flash[:success] = "会員情報が変更されました。"
      redirect_to mypage_path
    else
      render "edit"
    end
  end

  def confirm
    @end_user = current_end_user
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def end_user_params
      params.require(:end_user).permit(:name, :email, :postal_code, :address, :telephone_number)
  end

end
