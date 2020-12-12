class Purchase < ApplicationRecord
  belongs_to :supplier

  def self.total_purchase
    self.sum(:price)
  end
end
