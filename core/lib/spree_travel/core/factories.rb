FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_travel_core/factories'

  Dir["#{File.dirname(__FILE__)}/factories/**"].each do |f|
    require File.expand_path(f)
  end
end
