class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.belongs_to :user
      t.string :name
      t.string :date
      t.string :photo
      t.integer :duration
      t.integer :status
      t.timestamps
    end
  end
end
