class PagesNumberIndex < ActiveRecord::Migration
  def self.up
    add_index :pages, :number, :unique => true
  end

  def self.down
    remove_index :pages, :number, :unique => true
  end
end
