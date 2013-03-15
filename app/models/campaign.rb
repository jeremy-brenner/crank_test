class Campaign < ActiveRecord::Base
  has_many :days
  attr_accessible :name
end
