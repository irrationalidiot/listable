class List < ActiveRecord::Migration
  def self.up
    create_table :lists, :force => true do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
