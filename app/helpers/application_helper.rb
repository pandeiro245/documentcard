module ApplicationHelper
  def link_card card
    if card.content.match(/^http/)
      link_to card.content, card.content, target: '_blank'
    elsif match = card.content.match(/^card:([0-9]*)/)
      target_card = Card.find(match[1])
      link_to target_card.content, card_path(target_card)
    elsif @card == card
      link_to card.content, edit_card_path(card)
    else
      link_to card.content, card_path(card)
    end
  end
end
