class Product < ApplicationRecord
  belongs_to :category

  before_create :set_sku

  has_one_attached :image

  validates :image, content_type: ['image/jpeg', 'image/jpg', 'image/png']

  private
  def set_sku
    self.sku = SecureRandom.hex(20)
  end

end
