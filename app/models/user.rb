class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # belongs_to :book
  has_many :books, dependent: :destroy
  validates :name, presence: true
  # has_many :name, dependent: :destroy
end
