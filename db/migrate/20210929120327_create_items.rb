class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :title, null: false
      t.text    :explanation,        null: false
      t.integer :category_id,        null: false
      t.integer :items_sondition_id, null: false
      t.integer :postage_load_id,    null: false
      t.integer :prefecture_id,      null: false
      t.integer :shipment_day_id,    null: false
      t.timestamps
    end
  end
end
