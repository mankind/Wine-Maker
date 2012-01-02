class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :year
      t.string :family
      t.integer :winery_id, :null => false, :default => 0
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index(:wines, :winery_id)
  end
end
