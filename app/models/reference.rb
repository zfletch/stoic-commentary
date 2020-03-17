class Reference < ApplicationRecord
  belongs_to :text

  has_many :comments
  has_many :passages

  validates :ref, presence: true, uniqueness: { scope: :text_id }
  validates :rank, presence: true, uniqueness: { scope: :text_id }
end
