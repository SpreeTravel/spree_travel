CONFIG = :snc
###########################################################################
case CONFIG
when :pqr
  GEMS_PATH = 'http://localhost/rubygems/'
  SPREE_PATH = 'file:///home/pqr/work/jaf/spree'
  SPREE_TRAVEL_PATH = 'file:///home/pqr/work/jaf/openjaf'
when :snc
  GEMS_PATH = 'file:///home/test/.rvm/gems/ruby-1.9.3-p392/bundler/gems/'
  SPREE_PATH = 'file:///media/Data/jaf/spree'
  SPREE_TRAVEL_PATH = 'file:///media/Data/jaf/spree_travel'
when :raul
  GEMS_PATH = 'http://localhost/rubygems/'
  SPREE_PATH = 'file:///home/raul/RubymineProjects/spree'
  SPREE_TRAVEL_PATH = 'file:///home/raul/RubymineProjects/openjaf'
else
  GEMS_PATH = 'http://rubygems.org'
  SPREE_PATH = 'https://github.com/spree'
  SPREE_TRAVEL_PATH = 'https://github.com/openjaf'
end
###########################################################################
source GEMS_PATH

gem 'rails', '3.2.14'
gem 'sqlite3'
gem 'json'
gem 'jquery-rails'
gem 'google_static_maps_helper'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

#SPREE_GEMS
gem 'spree',                      :git => "#{SPREE_PATH}/spree", :branch => '2-0-stable'
gem 'spree_auth_devise',          :git => "#{SPREE_PATH}/spree_auth_devise", :branch => '2-0-stable'
gem 'spree_related_products', 	  :git => "#{SPREE_PATH}/spree_related_products"


#SPREE_TRAVEL_GEMS
gem 'spree_travel_core', 		  :git => "#{SPREE_TRAVEL_PATH}/spree_travel_core"
gem 'spree_property_type', 		  :git => "#{SPREE_TRAVEL_PATH}/spree_property_type"
gem 'spree_location',             :git => "#{SPREE_TRAVEL_PATH}/spree_location"
gem 'spree_travel_car',           :git => "#{SPREE_TRAVEL_PATH}/spree_travel_car"
gem 'spree_travel_sample',        :git => "#{SPREE_TRAVEL_PATH}/spree_travel_sample"
#gem 'spree_travel_ota',           :git => "#{SPREE_TRAVEL_PATH}/spree_travel_ota"


#gem 'spree_travel_hotel',:git => "#{SPREE_TRAVEL_PATH}/spree_travel_hotel"
#gem 'spree_travel_cruise',:git => "#{SPREE_TRAVEL_PATH}/spree_travel_cruise"
#gem 'spree_travel_rail',:git => "#{SPREE_TRAVEL_PATH}/spree_travel_rail"
#gem 'spree_travel_destination',  :git => "#{SPREE_TRAVEL_PATH}/spree_travel_destination"
#gem 'spree_travel_flight',       :git => "#{SPREE_TRAVEL_PATH}/spree_travel_flight"
#gem 'spree_travel_attraction',   :git => "#{SPREE_TRAVEL_PATH}/spree_travel_attaction"
#gem 'spree_travel_package',      :git => "#{SPREE_TRAVEL_PATH}/spree_travel_package"
#gem 'spree_travel_route',        :git => "#{SPREE_TRAVEL_PATH}/spree_travel_route"
#gem 'spree_travel_activity',     :git => "#{SPREE_TRAVEL_PATH}/spree_travel_activity"
#gem 'spree_travel_transfer',     :git => "#{SPREE_TRAVEL_PATH}/spree_travel_transfer"
