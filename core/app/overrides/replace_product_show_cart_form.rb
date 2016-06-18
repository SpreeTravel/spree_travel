Deface::Override.new(
    :virtual_path => 'spree/products/show',
    :name => 'replace_product_show',
    :replace_contents => "#cart-form[data-hook='cart_form']",
    :partial => "spree/products/product_type_cart",
    :disabled => false
)


