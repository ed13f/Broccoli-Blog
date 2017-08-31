class Entry < ApplicationRecord
  validates :title, :body, { presence: true }
  belongs_to :user, foreign_key: :user_id

  def self.most_recent
    Entry.order(created_at: :desc).limit(5)
  end
end
