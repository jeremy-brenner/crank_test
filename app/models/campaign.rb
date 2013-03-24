class Campaign < ActiveRecord::Base
  has_many :days
  attr_accessible :name, :created_at, :updated_at
end
