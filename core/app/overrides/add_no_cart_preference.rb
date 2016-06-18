Deface::Override.new(
    :virtual_path => 'spree/admin/general_settings/edit',
    :name => 'add_no_cart_preference_to_admin',
    :insert_after => "div.panel.panel-default.currency",
    :partial => "spree/admin/general_settings/no_cart",
    :disabled => false
)
