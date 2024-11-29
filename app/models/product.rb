class Product < ApplicationRecord
  belongs_to :category

  before_create :set_sku

  private
  def set_sku
    self.sku = SecureRandom.hex(20)
  end

end
