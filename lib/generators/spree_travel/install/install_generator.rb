module SpreeTravel
  module Generators
    class InstallGenerator < Rails::Generators::Base
      require 'spree_travel_core'
      require 'spree_travel/support'
      require 'colored'
      class_option :auto_run_migrations, :type => :boolean, :default => false
      class_option :full_install, :type => :boolean, :default => false
      class_option :without_sample, :type => :boolean, :default => false
      class_option :with_libs, :type => :array, :default => []

      def add_other_extensions

        extensions = options[:with_libs]
        all_extensions = ['hotel', 'flight']

        puts "Installing core library...".green

        silent_run("rails generate spree_travel_core:install --auto_run_migrations=true")

        puts "." * 20

        puts "Successfully installed core library".green

        if extensions == []
          extensions = all_extensions
        else
          extensions.each do |extension|
            unless all_extensions.include?(extension)
              puts "Invalid extension name, #{extension}, it wont be installed ...".red.bold
            end
          end
        end

        extensions.each do |extension|

          install_extension = options[extension]

          unless install_extension
            install_extension = options[:full_install] || ['', 'y', 'Y'].include?(ask "Would you like to add the #{extension} product type features? [Y/n]".yellow)
          end

          if install_extension
            puts "Installing #{extension} features...".green
            silent_run("rails generate spree_travel_#{extension}:install --auto_run_migrations=true")

            load_sample = options[:full_install] || ['', 'y', 'Y'].include?(ask "Would you like to add the #{extension} sample data? [Y/n]".yellow)

            if load_sample
              puts "Installing #{extension} sample data...".green
            else
              puts "Skipping installation of #{extension} sample data..."
            end
          else
            puts "Skipping installation of #{extension} features you can install it later using --with_libs = [#{extension}] attribute".yellow
          end
        end
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations || options[:full_install]
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
