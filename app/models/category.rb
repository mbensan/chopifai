# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(45)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :image, content_type: ['image/jpeg', 'image/jpg', 'image/png']
end
