Deface::Override.new(
    :virtual_path => 'spree/orders/_line_item',
    :name => 'replace_cart_product_description',
    :insert_bottom => "[data-hook='line_item_description']",
    :partial => "spree/orders/context_details",
    :disabled => false
)


