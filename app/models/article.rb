class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :announcement, presence: true
  validates :body, presence: true
end
