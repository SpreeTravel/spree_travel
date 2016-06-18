Deface::Override.new(
    :virtual_path => 'spree/products/show',
    :name => 'add_search_box_to_products_show',
    :insert_after => "[data-hook='product_properties']",
    :partial => "spree/shared/search_box",
    :disabled => false
)
