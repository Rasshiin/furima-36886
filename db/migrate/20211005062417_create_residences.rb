class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string     :postal_code,      null: false
      t.string     :municipalities,   null: false
      t.string     :address,          null: false
      t.string     :building_name
      t.string     :telephone,        null: false
      t.integer    :prefecture_id,    null: false
      t.references :purchase_history, null: false
      t.timestamps
    end
  end
end
