Deface::Override.new(
    :virtual_path => 'spree/shared/_order_details',
    :name => 'replace_order_details_product_description',
    :insert_bottom => "[data-hook='order_item_description']",
    :partial => "spree/shared/context_details",
    :disabled => false
)


