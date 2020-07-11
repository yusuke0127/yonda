class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_taggable_on :categories

  validates :title, presence: true
  validates :content, presence: true
end
