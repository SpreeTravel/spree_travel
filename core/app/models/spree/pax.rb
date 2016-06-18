module Spree
  class Pax < ActiveRecord::Base
    belongs_to :line_items
     # validates_presence_of :first_name, :last_name, :sex
    # validates :sex, inclusion: { in: %w(male female), message: "%{value} is not a valid sex." }
  end
end
