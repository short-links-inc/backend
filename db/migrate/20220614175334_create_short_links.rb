class CreateShortLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :short_links do |t|
      t.string :slug
      t.string :destination

      t.timestamps
    end

    add_index :short_links, :slug, unique: true
  end
end
