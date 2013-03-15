class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day
      t.string :subject
      t.text :message
      t.integer :send_time
      t.string :send_zone
      t.integer :campaign_id
      
      t.timestamps
    end
  end
end
