class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: 'Card', foreign_key: :parent_id
  include RankedModel
  ranks :position

  def below! card_id
    card = Card.find(card_id)
    self.position = card.position + 1
    self.save!
  end

  def style
    case style_id
    when 1
      'h'
    end
  end

  def h?
    style == 'h'
  end

  def children
    Card.where(parent_id: self.id).rank(:position)
  end

  def has_grandchild?
    children.map do |c|
      c.has_child?
    end.include?(true)
  end

  def has_child?
    children.present?
  end

  def breadcrumbs(limit=5)
    res = []
    i = 1
    parent = self.parent
    while i < limit && parent.present? && parent != parent.parent do
      res.unshift(parent)
      parent = parent.parent
      i += 1
    end
    res
  end
end
