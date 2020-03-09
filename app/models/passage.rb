class Passage < ApplicationRecord
  belongs_to :text

  has_many :comments

  def next_passage
    Passage.find_by(text: text, rank: rank + 1)
  end

  def previous_passage
    Passage.find_by(text: text, rank: rank - 1)
  end
end
