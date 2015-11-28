class WelcomeController < ApplicationController
  def index
    @cards = Card.where(parent_id: nil)
  end
end
