class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :day
      t.string :subject
      t.text :message
      t.integer :send_time
      t.string :send_zone

      t.timestamps
    end
  end
end
