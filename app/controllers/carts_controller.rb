class CartsController < ApplicationController
  def add_item
    product = Product.find(params[:product_id])
    if product.stock == 0
      redirect_to :back, notice: 'Producto sin Stock'
    else
      CartItem.create(product_id:params[:product_id], cart: @cart)
      product.stock -= 1
      product.save
      redirect_to root_path, notice: 'Producto añadido a su carrito'
    end
  end

  def remove_item
    cart_item = CartItem.find(params[:id])
    
    product = cart_item.product
    product.stock += 1
    product.save
    
    cart_item.destroy
    redirect_to root_path, notice: 'Producto removido de su carrito'
  end
end
