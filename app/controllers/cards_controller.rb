class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  def index
    @user_cards = Card.where(
      parent_id: nil
    ).order('created_at desc').limit(20)
    @cards = Card.order('created_at desc').limit(20)

  end

  def show
    if params[:exe] == 'totop'
      @card.position = @card.parent.children.order('position asc').first.position - 1
      @card.save!
      redirect_to @card.parent
    end
    if params[:level]
      cookies[:level] = params[:level]
    else
      cookies[:level] ||= 4
    end
    @cards = Card.where(parent_id: @card.id)
    @new_card = Card.new
    @new_card.parent_id = @card.id
  end


  def create
    @card = Card.new(card_params)
    if @card.content.blank?
      r = @card.parent.parent
    else 
      @card.user_id = cookies[:user_id]
      if @card.save
        r =  card_path(@card.parent)
      end
    end
    redirect_to r
  end

  def update
    if @card.update(card_params)
      redirect_to card_path(@card)
    end
  end

  def rand
    redirect_to Card.order("RAND()").first
  end

  def destroy
    redirect_to root_path unless @card.parent
    parent = @card.parent
    @card.destroy
    redirect_to card_url(parent), notice: 'successfully destroyed.'
  end


  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:content, :parent_id, :row_order_position)
    end
end
