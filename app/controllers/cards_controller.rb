class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  def index
    redirect_to card_path(Card.first)
  end

  def show
    @cards = Card.where(parent_id: @card.id)
    @new_card = Card.new
    @new_card.parent_id = @card.id
  end


  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to card_path(Card.first)
    end
  end

  def update
    if @card.update(card_params)
      redirect_to card_path(Card.first)
    end
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:content, :parent_id)
    end
end
