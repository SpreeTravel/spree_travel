module Spree
    OrdersController.class_eval do

      def populate
        order    = current_order(create_order_if_necessary: true)
        variant  = Spree::Variant.find(params[:variant_id])
        rate     = Spree::Rate.find(params[:rate_id]) if params[:rate_id]
        context  = Spree::Context.build_from_params(params, :temporal => false)
        quantity = params[:quantity].to_i
        options  = params[:options] || {}

        # 2,147,483,647 is crazy. See issue #2695.
        if quantity.between?(1, 2_147_483_647)
          begin
            order.contents.add(variant, quantity, rate, context,  options)
          rescue ActiveRecord::RecordInvalid => e
            error = e.record.errors.full_messages.join(", ")
          end
        else
          error = Spree.t(:please_enter_reasonable_quantity)
        end

        if error
          flash[:error] = error
          redirect_back_or_default(spree.root_path)
        else
          if Spree::Config.use_cart
            respond_with(order) do |format|
              format.html { redirect_to cart_path }
            end
          else
            @order = current_order
            params.merge!('checkout'=>'')
            self.update
          end
        end
      end


  end
end
