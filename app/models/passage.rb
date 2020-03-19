class Passage < ApplicationRecord
  belongs_to :edition
  belongs_to :reference

  validates :passage, presence: true
  validates :reference_id, uniqueness: { scope: :edition_id }

  def edition_id
    edition.id
  end

  def edition_name
    edition.name
  end
end
