class CreateUrls < ActiveRecord::Migration
  def self.up
    create_table :urls do |t|
      t.column(:long_link, :string, {:limit => 2048})
      t.column(:short_link, :string, {:limit => 6})
      t.column(:times_accessed, :integer)
      t.timestamps
    end

    add_index(:urls, :long_link)
    add_index(:urls, :short_link)
    
  end

  def self.down
    drop_table :urls
  end
end
