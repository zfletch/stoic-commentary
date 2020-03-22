class Edition < ApplicationRecord
  belongs_to :text

  has_many :passages, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  def self.default_left
    @default_left ||= Edition.find_by(name: 'Greek').id
  end

  # The default edition to show on the right side of the /references/:ref
  # page is the comments which is represented by the string `c`
  def self.default_right
    'c'
  end
end
