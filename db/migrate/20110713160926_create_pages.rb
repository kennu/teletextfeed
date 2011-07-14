class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :number
      t.integer :next_number
      t.integer :prev_number

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
