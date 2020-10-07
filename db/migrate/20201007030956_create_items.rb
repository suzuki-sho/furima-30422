class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title
      t.integer    :price
      t.text       :description
      t.references :user, foreign_key: true
      t.integer    :category_id
      t.integer    :state_id
      t.integer    :shipping_id
      t.integer    :area_id
      t.integer    :days_id
      t.timestamps
    end
  end
end
