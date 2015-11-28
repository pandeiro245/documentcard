class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: 'Card', foreign_key: :parent_id
  has_many :children, class_name: 'Card', foreign_key: :parent_id

  def breadcrumbs
    res = []
    parent = self.parent
    #while parent.present? do
      res.push(parent)
    #  paernt = parent.parent
    #end
    res
  end
end
