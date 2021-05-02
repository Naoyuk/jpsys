class Line < ApplicationRecord
  validates :purchase_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  belongs_to :purchase

  def subtotal
    price * quantity - discount
  end
end
