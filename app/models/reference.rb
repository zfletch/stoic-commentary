class Reference < ApplicationRecord
  belongs_to :text

  has_many :comments, dependent: :destroy
  has_many :passages, dependent: :destroy

  validates :ref, presence: true, uniqueness: { scope: :text_id }
  validates :rank, presence: true, uniqueness: { scope: :text_id }

  def to_param
    ref
  end

  # The convention for routes that return a certain format is to use . followed by that format:
  # e.g. /users/1.json or /users/1.xml
  # This means that we can't use the . as part of the route.
  # Instead use - and convert - to . when displayed to the user.
  def display_ref
    ref.tr('-', '.')
  end
end
