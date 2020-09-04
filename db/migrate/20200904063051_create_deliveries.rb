class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :item,                null: false,  foreign_key: true
      t.string     :postal_code,       	 null: false
      t.integer    :prefecture_id,       null: false
      t.string     :city,                null: false
      t.string     :adress,     	       null: false
      t.string     :building_name
      t.string     :tell,                 null: false
      t.timestamps
    end
  end
end
