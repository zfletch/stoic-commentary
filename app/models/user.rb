class User < ApplicationRecord
  has_secure_password

  has_many :comments

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  enum role: %w[
    contributor
    admin
  ]
end
