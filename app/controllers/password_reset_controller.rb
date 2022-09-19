class PasswordResetController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #Send mail
      redirect_to root_path, notice: 'If this email does exist, check your inbox'
      
    else
      
    end

  end
  
end