class Order < ApplicationRecord
  belongs_to :customer
  has_many :lists, dependent: :destroy
end
