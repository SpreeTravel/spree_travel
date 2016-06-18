Spree::Admin::GeneralSettingsController.class_eval do

  def edit
    @preferences_cart = [:use_cart]
    @preferences_security = []
  end


end
