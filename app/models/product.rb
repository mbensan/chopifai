# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  price       :integer          not null
#  sku         :string(255)      not null
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stock       :integer          default(0), not null
#
class Product < ApplicationRecord
  belongs_to :category

  before_create :set_sku

  has_one_attached :image

  validates :image, content_type: ['image/jpeg', 'image/jpg', 'image/png']

  has_many :cart_items, dependent: :destroy
  
  private
  def set_sku
    self.sku = SecureRandom.hex(20)
  end

end
