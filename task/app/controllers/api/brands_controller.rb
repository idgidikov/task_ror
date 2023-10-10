class Api::BrandsController < ApplicationController
    def index
        @brands = Brand.where(active: true)
        render 'api/brands/index', formats: [:html]
        
      end
      
      def show
        @brand = Brand.find(params[:id])
        @active_products = @brand.products.where(active: true)
        render 'api/brands/show'
      end
end
