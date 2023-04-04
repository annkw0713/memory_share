class Memory < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, :date, :person, :place, :description, :images, presence: true
  validates :images, length: { minimum: 1, maximum: 20, message: "は1枚以上20枚以下にしてください" }
end
