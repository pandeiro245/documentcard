module ApplicationHelper
  def link_card card
    if card.content.match(/^http/)
      link_to card.content, card.content, target: '_blank'
    else
      link_to card.content, card_path(card)
    end
  end
end
