class UsersController < ApplicationController
  def login
    @auth = request.env["omniauth.auth"]
    twitter_id = @auth[:uid].to_i
    user = User.find_or_create_by(
      twitter_id: twitter_id
    )
    user.name = @auth[:info][:name]
    user.icon_url = @auth[:info][:image]
    user.save!
    if user.card.blank?
      Card.create!(content: "#{user.name}の頭の中", user: user)
    end
    cookies[:user_id] = user.id
    redirect_to root_path
  end

  def logout
    # TODO delete method にする
    cookies[:user_id] = nil
    redirect_to root_path
  end
end
