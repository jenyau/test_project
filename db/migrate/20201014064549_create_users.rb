class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin, default: false
      t.string :phone_number
      t.string :image
      t.timestamps
    end
  end
end
