class Book < ApplicationRecord
  has_one_attached :image
  # has_many :users, dependent: :destroy
  belongs_to :user
end
