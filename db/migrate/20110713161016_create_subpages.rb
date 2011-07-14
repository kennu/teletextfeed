class CreateSubpages < ActiveRecord::Migration
  def self.up
    create_table :subpages do |t|
      t.references :page
      t.integer :number
      t.text :content
      t.text :raw_content

      t.timestamps
    end
  end

  def self.down
    drop_table :subpages
  end
end
