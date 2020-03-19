class Reference < ApplicationRecord
  belongs_to :text

  has_many :comments
  has_many :passages

  validates :ref, presence: true, uniqueness: { scope: :text_id }
  validates :rank, presence: true, uniqueness: { scope: :text_id }

  def self.first
    Reference.order(:rank).first
  end

  def self.last
    Reference.order(:rank).last
  end

  def next
    Reference.find_by(rank: rank + 1) || self
  end

  def previous
    Reference.find_by(rank: rank - 1) || self
  end

  def to_param
    ref
  end

  # The convention for routes that return a certain format is to use . followed by that format:
  # e.g. /users/1.json or /users/1.xml
  # This means that we can't use the . as part of the route.
  # Instead use - and convert - to . when displayed to the user.
  def display_ref
    ref.gsub('-', '.')
  end
end
