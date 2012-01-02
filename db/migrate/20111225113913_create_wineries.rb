class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
