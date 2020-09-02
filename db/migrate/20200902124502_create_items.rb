class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,          null: false
      t.text       :introduction,  null: false
      t.integer    :category_id,   null: false
      t.integer    :condition,     null: false
      t.integer    :price,         null: false
      t.integer    :delivery_fee,  null: false
      t.integer    :delivery_days, null: false
      t.integer    :prefecture_id, null: false
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end