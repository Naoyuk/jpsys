# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :order
  belongs_to :item
end
