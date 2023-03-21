class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.boolean :activated, null: false
      t.string :email
      t.string :name
      t.string :uid

      t.timestamps
    end
  end
end
