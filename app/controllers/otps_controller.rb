class OtpsController < ApplicationController
  def create
    @account = Account.find_by(phone: otp_params) || Account.create!(phone: otp_params)

    new_otp = ''
    6.times { new_otp += rand(0..9).to_s }

    @otp = Otp.new(account: @account, otp: new_otp)

    if @otp.save
      redirect_to account_path(@account.id)
    end
  end

  private

  def otp_params
    params.require(:phone)
  end
end
