module Spree
  class LineItemsController < Spree::StoreController

    def update
      @line_item = Spree::LineItem.find(params[:id])
      puts line_item_params.inspect
      if @line_item.update_attributes(line_item_params)
        redirect_to '/cart', notice: 'Pax was successfully updated.'
      else 
        render action: '/cart', notice: 'Pax was not updated.'
      end
    end

    private
      
      def line_item_params
        if params[:line_item]
          params[:line_item].permit(*permitted_line_item_attributes)
        else
          {}
        end
      end

  end
end
