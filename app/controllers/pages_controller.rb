class PagesController < ApplicationController
  def home
  end

  def create_otp 
  end

  def success
  end

  def failure
    @message = params[:message]
  end
end
