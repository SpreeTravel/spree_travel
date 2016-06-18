Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
                     :name => "remove_cart_link",
                     :replace => "ul.navbar-right[data-hook]",
                     :partial => 'spree/shared/show_cart_link' )
