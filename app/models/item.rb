# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  price          :integer          not null
#  stock          :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true

  has_many :lists
end
