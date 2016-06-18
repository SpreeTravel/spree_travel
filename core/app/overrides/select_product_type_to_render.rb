Deface::Override.new(
    :virtual_path => 'spree/shared/_products',
    :name => 'select_product_type_to_render',
    :replace_contents => "div#products",
    :partial => "spree/products/product_type_selector",
    :disabled => false
)


