class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title, :limit => 256, :null => false
      t.string :subtitle, :limit => 256
      t.string :print_isbn, :limit  =>  20, :null => false
      t.string :eisbn, :limit => 20, :null  => false
      t.string :complexity, :limit => 16, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
