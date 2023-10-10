class Api::BrandsController < ApplicationController
    def index
        @brands = Brand.where(active: true)
        render 'api/brands/index', formats: [:html]
        
      end
end
