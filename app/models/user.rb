# frozen_string_literal: true

# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  email            :string           not null
#  password_digest  :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# index_users_on_email (email) UNIQUE
#

class User < ApplicationRecord
  # Not all of the databases use index for distinguishing upper cases and lower cases.
  # So cast email address to downcase before save it
  before_save { self.email = email.downcase }

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
