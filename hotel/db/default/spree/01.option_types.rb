### This is the data
option_types = [
  {:name => "start_date", :presentation => "Start Date", :attr_type => 'date', :short => 'Start'},
  {:name => "end_date", :presentation => "End Date", :attr_type => 'date', :short => 'End'},
  {:name => "room_type", :presentation => "Room Type", :attr_type => 'selection', :short => 'Room Type'},
  {:name => "plan", :presentation => "Plan", :attr_type => 'selection', :short => 'Plan'},
  {:name => "adult", :presentation => "Adult", :attr_type => 'integer', :short => 'Adult'},
  {:name => "child", :presentation => "Child", :attr_type => 'integer', :short => 'Child'},
  {:name => "room_count", :presentation => "Room Count", :attr_type => 'integer', :short => 'Room Count'},
  {:name => "simple", :presentation => "Simple", :attr_type => 'float', :short => 'x 1'},
  {:name => "double", :presentation => "Double", :attr_type => 'float', :short => 'x 2'},
  {:name => "triple", :presentation => "Triple", :attr_type => 'float', :short => 'x 3'},
  {:name => "first_child", :presentation => "First Child", :attr_type => 'float', :short => '1st'},
  {:name => "second_child", :presentation => "Second Child", :attr_type => 'float', :short => '2nd'},
  {:name => "destination", :presentation => "Destination", :attr_type => 'destination', :short => 'Dest'},
]

### Creating Option Types
option_types.each do |ot|
  Spree::OptionType.where(:name => ot[:name]).first_or_create(:presentation => ot[:presentation], :attr_type => ot[:attr_type])
end

### Creating Destination Taxonomy
Spree::Taxonomy.first_or_create( :name => "Destination")

