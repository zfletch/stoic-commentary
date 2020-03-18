class User < ApplicationRecord
  has_secure_password

  has_many :comments

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password_confirmation, presence: { if: ->(u) { u.password.present? } }
  validates :password, length: { minimum: 8 }, allow_nil: true

  enum role: %w[
    contributor
    admin
  ]
end
