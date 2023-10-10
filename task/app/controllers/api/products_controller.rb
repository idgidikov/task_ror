class Api::ProductsController < ApplicationController
  def index
    @active_products = Product.where(active: true).includes(:brand)
    render 'api/products/index'
  end
end
