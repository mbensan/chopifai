class CartsController < ApplicationController
  def add_item
    product = Product.find(params[:product_id])
    if product.stock == 0:
      redirect_back, notice: 'Producto sin Stock'
    else
      CartItem.create(product_id:params[:product_id], cart: @cart)
      product.stock -= 1
      product.save
      redirect_to root_path, notice: 'Producto añadido'
    end
  end
end
