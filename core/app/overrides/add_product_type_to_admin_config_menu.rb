Deface::Override.new(
    :virtual_path => 'spree/admin/shared/sub_menu/_configuration',
    :name => 'add_product_type_to_admin_config_menu',
    :insert_bottom => "#sidebar-configuration",
    text: "  <%= configurations_sidebar_menu_item(Spree.t(:product_types), spree.admin_product_types_path) if can? :manage, Spree::ProductType %>
",
    disabled: false
)


