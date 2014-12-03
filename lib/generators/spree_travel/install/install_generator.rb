module SpreeTravel
  module Generators
    class InstallGenerator < Rails::Generators::Base
      require 'spree_travel_core'
      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require store/spree_travel\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require admin/spree_travel\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require store/spree_travel\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require admin/spree_travel\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_travel'
        run 'bundle exec rake railties:install:migrations FROM=spree_travel_core'
        run 'bundle exec rake railties:install:migrations FROM=spree_travel_hotel'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end

      # def run_other_stuffs
      #   run 'rails generate spree_travel_core:install --auto_run_migrations=false'
      # end
    end
  end
end
