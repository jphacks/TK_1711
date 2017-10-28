class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.belongs_to :container
      t.string :sender
      t.string :shop
      t.integer :mount
      t.timestamps
    end
  end
end
