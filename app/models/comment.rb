class Comment < ApplicationRecord
  belongs_to :reference
  belongs_to :user

  validates :comment, presence: true

  enum status: %w[
    approved
    pending
    deleted
    removed
  ]

  def user_name
    user.name
  end
end
