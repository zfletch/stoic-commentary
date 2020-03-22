class Text < ApplicationRecord
  has_many :editions, dependent: :destroy
  has_many :references, dependent: :destroy

  validates :urn, uniqueness: true
end
