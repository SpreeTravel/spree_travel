Deface::Override.new(
    :virtual_path => 'spree/products/index',
    :name => 'add_search_box_to_product_index',
    :insert_before => "[data-hook='homepage_products']",
    :partial => "spree/shared/search_box",
    :disabled => false
)
