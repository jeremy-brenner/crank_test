class Page < ActiveRecord::Base
  attr_accessible :day, :message, :send_time, :send_zone, :subject
end
