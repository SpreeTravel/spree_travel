Deface::Override.new(:virtual_path => "spree/taxons/show",
                     :name => "remove_taxon_children_from_index",
                     :remove => "[data-hook='taxon_children']",
                     :disabled => false
)
