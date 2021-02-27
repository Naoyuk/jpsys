# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  email          :string           not null
#  address        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Customer < ApplicationRecord
  validates :name, presence: true

  has_many :orders
end
