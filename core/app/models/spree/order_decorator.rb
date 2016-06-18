Spree::Order.class_eval do

    remove_checkout_step :delivery
    insert_checkout_step :pax, :after => :address

    Spree::Order.state_machine.before_transition :to => :pax, :do => :paxes_count

    def paxes_count
      self.line_items.each do |line_item|
        count = line_item.context.adult(:temporal => false).to_i + line_item.context.child(:temporal => false).to_i
        if line_item.paxes.empty?
          count.times { line_item.paxes.new }
        end
      end
    end

    def empty!
      line_items.each do |li|
        li.paxes.destroy_all
      end
      line_items.destroy_all
      adjustments.destroy_all
    end

    def find_line_item_by_variant(variant, rate=nil, context=nil,  options = {})
      line_items.detect { |line_item|
        line_item.variant_id == variant.id &&
          line_item_options_match(line_item, options)
      }

      # line_items.detect { |line_item|
      #   line_item.variant_id == rate.variant.id &&
      #       line_item_options_match(line_item, options)
      #   line_item.context = context
      # }
    end


end
