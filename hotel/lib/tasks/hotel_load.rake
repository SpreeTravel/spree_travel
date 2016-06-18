require 'ffaker'

namespace :spree_travel_hotel do
  desc 'Option Values, Properties, etc. for Hotels'
  task :load do
    sample_path = File.join(File.dirname(__FILE__), '..', '..', 'db', 'default', 'spree')

    Rake::Task['db:load_dir'].reenable
    Rake::Task['db:load_dir'].invoke(sample_path)
  end
end
