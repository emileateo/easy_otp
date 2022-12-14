require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_phone = '95558989'
    @account = Account.create!(phone: @test_phone)

    Otp.create!(otp: '123456', account: @account)
  end

  test 'redirects successfully on correct OTP' do
    # post verify_otp_path(phone: @test_phone, otp: '123456')

    print "phone: #{@test_phone}"
    print "account: #{@account}"

    assert_redirected_to('/success')
  end
end
