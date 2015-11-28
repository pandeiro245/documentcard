class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  def index
    @cards = Card.where(parent_id: nil)
  end

  def show
    @cards = Card.where(parent_id: @card.id)
    @new_card = Card.new
    @new_card.parent_id = @card.id
  end


  def create
    @card = Card.new(card_params)
    @card.user_id = cookies[:user_id]
    if @card.save
      redirect_to card_path(@card.parent)
    end
  end

  def update
    if @card.update(card_params)
      redirect_to card_path(@card)
    end
  end

  def sort
    card = Card.find(params[:card_id])
    card.update(card_params)
    render nothing: true
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:content, :parent_id, :row_order_position)
    end
end
