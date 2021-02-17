# frozen_string_literal: true

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
