Spree::Order.class_eval do

  def update_from_params(params, permitted_params, request_env = {})
    success = false
    @updating_params = params
    run_callbacks :updating_from_params do
      # Set existing card after setting permitted parameters because
      # rails would slice parameters containg ruby objects, apparently
      existing_card_id = @updating_params[:order] ? @updating_params[:order].delete(:existing_card) : nil

      attributes = @updating_params[:order] ? @updating_params[:order].permit(permitted_params).delete_if { |_k, v| v.nil? } : {}

      if existing_card_id.present?
        credit_card = CreditCard.find existing_card_id
        if credit_card.user_id != user_id || credit_card.user_id.blank?
          raise Core::GatewayError.new Spree.t(:invalid_credit_card)
        end

        credit_card.verification_value = params[:cvc_confirm] if params[:cvc_confirm].present?

        attributes[:payments_attributes].first[:source] = credit_card
        attributes[:payments_attributes].first[:payment_method_id] = credit_card.payment_method_id
        attributes[:payments_attributes].first.delete :source_attributes
      end

      if attributes[:payments_attributes]
        attributes[:payments_attributes].first[:request_env] = request_env
      end

      if attributes["line_items_attributes"]
        attributes["line_items_attributes"].each do |key, value|
          temporal =  attributes["line_items_attributes"][key].delete("paxes_attributes")
          #TODO, this is a patch because i don't know why 'update_attributes' in next line
          #TODO, adds new paxes and does not update existing.
          puts temporal.inspect
          self.line_items[key.to_i].paxes.delete_all
          self.line_items[key.to_i].update_attributes("paxes_attributes" => temporal)
          success = true
        end
      else
        success = self.update_attributes(attributes)
      end

      set_shipments_cost if shipments.any?
    end

    @updating_params = nil
    success
  end

end
