class Edition < ApplicationRecord
  belongs_to :text

  has_many :passages

  validates :name, presence: true
  validates :description, presence: true
end
