class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
  end

  def verify
    @account = Account.find_by(phone: params[:phone])

    return redirect_to failure_path(message: 'Account does not exist') if !@account

    account_last_otp = @account.otps.last

    @given_otp = params[:otp]
    
    if account_last_otp.otp == @given_otp
      if account_last_otp.created_at < Time.now - 10.minutes
        redirect_to failure_path(message: 'Your OTP has expired')
      else
        redirect_to success_path
      end
    else
      redirect_to failure_path(message: 'Wrong OTP')
    end
  end

  private

  def verification_params
    params.require(:phone, :otp)
  end
end
