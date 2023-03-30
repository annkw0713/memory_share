class Memory < ApplicationRecord
  belongs_to :user

  validates :title, :date, :person, :place, :description, presence: true
end
