class Memory < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, :date, :person, :place, :description, :image, presence: true
end
