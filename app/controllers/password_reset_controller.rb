class PasswordResetController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #Send mail
      PasswordMailer.with(user: @user).reset.deliver_now

      redirect_to root_path, notice: 'If this email does exist, check your inbox'
      
    else
      redirect_to signup_path, notice: "toi bandit degages"
      
    end

  end

  def edit
    
  end

  def update
    
  end
  
end