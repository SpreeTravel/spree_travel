Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "remove_shipping_specs_from_admin_product_form",
                     :remove => "#shipping_specs",
                     :disabled => false
)
