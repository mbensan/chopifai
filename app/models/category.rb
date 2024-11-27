class Category < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :image, content_type: ['image/jpeg', 'image/jpg', 'image/png']
end
