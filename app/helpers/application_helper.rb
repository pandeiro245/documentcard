module ApplicationHelper
  def link_card card
    if m = card.content.match(/^https:\/\/gyazo.com\/([0-9a-z]*)/)
      link_to (image_tag "https://i.gyazo.com/#{m[1]}.png"), card.content, {target: '_blank'}
    elsif card.content.match(/^http/)
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

  def card_icon card
    link_to (image_tag card.user.icon_url, style: 'width: 25px;'), card_path(card.user.card)
  end
end
