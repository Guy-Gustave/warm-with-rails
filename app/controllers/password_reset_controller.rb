class PasswordResetController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #Send mail
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path, notice: 'If the account of this email has found, check your inbox we have sent a link to reset your password'


  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to signin_path, alert: 'token has expired'
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to signin_path, notice: 'Your password was reset successifully, Please Sign_in'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  
end