class User < ActiveRecord::Base
  has_many :cards

  def card
    Card.where(parent_id: nil, user: self)
  end
end
