class Word < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :likeusers, through: :favorites, source: :user, dependent: :destroy

end
