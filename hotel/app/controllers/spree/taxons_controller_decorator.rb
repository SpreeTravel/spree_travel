Spree::TaxonsController.class_eval do

  # def hotel_autocomplete
  #   place_taxonomy = Spree::Taxonomy.find_by_name('Destination')
  #   places = Spree::Taxon.where("name like ? AND taxonomy_id = ? ", "%#{params['term']}%", place_taxonomy.id)
  #   render json: places.collect{|d|[d.name]}
  # end

end
