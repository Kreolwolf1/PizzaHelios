class AddColumnCountInLineitems < ActiveRecord::Migration
  def self.up
  	add_column :line_items, :count, :integer
  end

  def self.down
  	remove_column :line_items, :count
  end
end
