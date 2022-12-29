class Book < ApplicationRecord
  has_one_attached :image
  # has_many :users, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
end
