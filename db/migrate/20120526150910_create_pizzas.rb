class CreatePizzas < ActiveRecord::Migration
  def self.up
    create_table :pizzas do |t|
      t.string :name
      t.string :cost
      t.integer :mass
      t.text :description
      t.integer :diameter

      t.timestamps
    end
  end

  def self.down
    drop_table :pizzas
  end
end
