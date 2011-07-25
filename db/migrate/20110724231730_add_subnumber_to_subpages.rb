class AddSubnumberToSubpages < ActiveRecord::Migration
  def self.up
    add_column :subpages, :subnumber, :integer
  end

  def self.down
    remove_column :subpages, :subnumber
  end
end
