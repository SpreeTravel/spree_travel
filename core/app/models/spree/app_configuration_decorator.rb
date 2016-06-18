Spree::AppConfiguration.class_eval do
  preference :use_cart, :boolean, default: true #true if you want to have a cart or false will directly to the checkout process with one product only
end