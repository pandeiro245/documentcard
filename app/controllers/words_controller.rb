class WordsController < ApplicationController
  def index
    @cards = Card.where("content like '%#{params[:q]}%'")
    redirect_to @cards.first if @cards.count == 1
  end
end
