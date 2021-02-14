class Post < ApplicationRecord
  acts_as_votable
  include PgSearch::Model
  pg_search_scope :search_by_title_and_content,
                  against: %i[title content],
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_taggable_on :categories

  validates :title, presence: true
  validates :content, presence: true
end
