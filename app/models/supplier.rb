# frozen_string_literal: true

class Supplier < ApplicationRecord
  has_many :purchases
end
