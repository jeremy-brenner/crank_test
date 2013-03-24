class Day < ActiveRecord::Base
  belongs_to :campaign
  attr_accessible :day, :message, :send_time, :send_zone, :subject, :campaign_id, :created_at, :updated_at
end
