module Spree
  module Admin
    ProductsController.class_eval do
      after_action :after_save, only: :create

      def after_save
          @product.generate_variants if !@product.product_type.nil?
      end

      def delete_rates
        rates_array = params[:rates].split(',')
        rates_array.each do |rate_id|
          Spree::Rate.find(rate_id).destroy
        end
        flash[:success] = t(:successfully_deleted_rates)
        respond_to do |format|
          format.js
        end
      end

    end
  end
end
