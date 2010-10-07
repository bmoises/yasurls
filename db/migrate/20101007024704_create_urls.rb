class CreateUrls < ActiveRecord::Migration
  def self.up
    create_table :urls do |t|
      t.column(:destination, :string, {:limit => 2048})
      t.column(:code, :string, {:limit => 6})
      t.timestamps
    end

    add_index(:urls, :code)
    add_index(:urls, :destination)
    
  end

  def self.down
    drop_table :urls
  end
end
