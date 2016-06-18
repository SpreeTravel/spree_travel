Deface::Override.new(
    :virtual_path => 'spree/admin/option_types/edit',
    :name => 'add_condition_to_option_value_new',
    :replace => "#new_add_option_value",
    :partial => "spree/admin/option_types/conditioned_option_value_new",
    :disabled => true
)
