# frozen_string_literal: true

class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :representative, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_many :purchases
end
