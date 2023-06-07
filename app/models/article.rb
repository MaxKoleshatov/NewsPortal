class Article < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :category
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :announcement, presence: true
  validates :body, presence: true

  def moder
    self.approved == true
  end
end
