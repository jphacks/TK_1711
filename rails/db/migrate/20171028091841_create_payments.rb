class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :sender
      t.string :reciever
      t.integer :mount
      t.timestamps
    end
  end
end
