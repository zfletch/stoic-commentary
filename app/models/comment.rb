class Comment < ApplicationRecord
  belongs_to :passage
  belongs_to :user
end
