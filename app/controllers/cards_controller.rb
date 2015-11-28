class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  def index
    @cards = Card.where(parent_id: nil)
    @new_card = Card.new
  end

  def show
    @cards = Card.where(parent_id: @card.id)
    @new_card = Card.new
    @new_card.parent_id = @card.id
  end


  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to card_path(@card)
    end
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:content)
    end
end
