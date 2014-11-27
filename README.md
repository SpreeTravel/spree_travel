SpreeTravel
===========
Spree Travel is an extension for rails e-commerce platform [spree](https://github.com/spree/spree).The goal of Spree Travel is to provide spree with the essential functionalities to behave as a travel agency management platform. This means that this spree extension will add new models, behaviors, views, etc… to spree, and will modify some of the definition it holds. Spree Travel consists in a group of gems that modularizes all the behaviors intended to create with the extension:

- [Spree Travel Core](https://github.com/openjaf/spree_travel_core), holds the logic under the hole group of extensions.
- [Spree Travel Hotel](https://github.com/openjaf/spree_travel_hotel), holds the definitions to model hotels product_types.
- [Spree Travel Sample](https://github.com/openjaf/spree_travel_sample), encapsulates the seeded data needed to understand and watch the behaivor of the entire pack.


###Important Note
The Spree Travel project is a work in progress, and will suffer major changes. Please use it and keep a live feedback with the team by opening a [GitHub issue](https://github.com/openjaf/spree_travel/issues/new).

Requirements
------------
### Rails and Spree
Spree Travel now requires Rails version **>= 4.0** and a Spree version **>=2.3**.

Installation
------------

Spree Travel is not yet distributed as a gem, so it should be used in your app with a git reference or you can download the source and build the gem on your own.

1. Add the following to your Gemfile

  ```ruby
    gem 'spree_travel’, :git => 'https://github.com/openjaf/spree_travel.git', :branch => '2-4-stable'
  ```

2. Run `bundle install`

3. To copy and apply migrations run:

  ```
  rails g spree_travel:install
  ```

Installation (alternate)
------------

1. Add the following to your gemfile:

  ```ruby
    gem 'spree_travel_core’, :git => 'https://github.com/openjaf/spree_travel_core.git', :branch => '2-4-stable'
    gem 'spree_travel_hotel’, :git => 'https://github.com/openjaf/spree_travel_hotel.git', :branch => '2-4-stable'
    gem 'spree_travel_package’, :git => 'https://github.com/openjaf/spree_travel_package.git', :branch => '2-4-stable'
    gem 'spree_travel_flight’, :git => 'https://github.com/openjaf/spree_travel_flight.git', :branch => '2-4-stable'
    gem 'spree_travel_sample’, :git => 'https://github.com/openjaf/spree_travel_sample.git', :branch => '2-4-stable'
  ```

2. run `bundle install`

3. To copy and install migrations and assets run:

  ```ruby
  rails generate spree_travel_core:install
  rails generate spree_travel_hotel:install
  rails generate spree_travel_package:install
  rails generate spree_travel_flight:install
  ```

4. To load seed data needed to spree travel to work correctly run:

  ```ruby
  rake spree_travel_core:load
  rake spree_travel_hotel:load
  rake spree_travel_package:load
  rake spree_travel_flight:load
  ```

5. To load sample data run:

  ```ruby
  rake spree_travel_sample:load PRODUCT_TYPE=all,hotels,packages
  ```

Features
------------

- Encapsultes the behaivor of the spree_travel pack to extend spree into a travel agency manager site.


Contributing
------------

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Post a [pull request](https://github.com/openjaf/spree_travel/compare/).
2. Or open a [GitHub issue](https://github.com/openjaf/spree_travel/issues/new).

License
-------
Copyright © 2013 OpenJAF, released under the New BSD License.
