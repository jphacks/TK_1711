class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.belongs_to :user
      t.string :name
      t.string :data
      t.string :status
      t.timestamps
    end
  end
end