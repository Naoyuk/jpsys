# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :supplier

  def self.total_purchase
    sum(:price)
  end
end
