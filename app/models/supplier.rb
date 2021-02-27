# frozen_string_literal: true

# Table name: suppliers
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  representative :string           not null
#  email          :string           not null
#  address        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :representative, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :purchases
end
