class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :auto_login

  def auto_login
    if user_id = cookies[:user_id]
      @user = User.find(user_id)
    else
      @user = User.create!
      @card = Card.create!(content: "user_#{@user.id}")
      cookies[:user_id] = @user.id
    end
  end
end
