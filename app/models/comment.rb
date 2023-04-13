class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :memory

  validates :content, presence: true
end
