# encoding: UTF-8

require 'yaml'
yaml = YAML.load(File.read('SPREE_TRAVEL_VERSIONS'))
versions = yaml['gems']

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_travel'
  s.version     = '3.0.0'
  s.summary     = 'Meta package for spree travel platform'
  s.description = 'Meta package dependencies for spree travel installation'
  s.required_ruby_version = '>= 1.9.3'

  s.authors   = ['Pedro Quintero Rojas', 'Miguel Sancho Fernandez', 'Cesar Lage Codorníu', 'Raul Perez-Alejo Neyra']
  s.email     = 'info@openjaf.com'
  s.homepage  = 'http://github.com/openjaf/spree_travel'

  s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_travel_core', s.version
  s.add_dependency 'spree_travel_hotel', s.version

end

