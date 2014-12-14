# encoding: UTF-8

require 'yaml'
yaml = YAML.load(File.read('SPREE_TRAVEL_VERSIONS'))
versions = yaml['gems']

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_travel'
  s.version     = '2.4.2'
  s.summary     = 'Meta package for spree travel platform'
  s.description = 'Meta package dependencies for spree travel installation'
  s.required_ruby_version = '>= 1.9.3'

  # s.author    = 'You'
  # s.email     = 'you@example.com'
  # s.homepage  = 'http://www.spreecommerce.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> ' + versions['spree']
  s.add_dependency 'colored'
  # s.add_dependency 'spree_travel_core', '~> ' + versions['spree']
  # s.add_dependency 'spree_travel_sample', '~> ' + versions['spree']
  # s.add_dependency 'spree_travel_hotel', '~> ' + versions['spree']
  # s.add_dependency 'spree_travel_flight', '~> ' + versions['spree']

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
