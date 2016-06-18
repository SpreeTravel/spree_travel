module Spree
  ProductsController.class_eval do
    before_action :add_childrens_param, only: :show

    def add_childrens_param
      begin
        @childrens = @product.childrens || @product.variants
      rescue
        @childrens = @product.variants
      end
    end

  end
end
