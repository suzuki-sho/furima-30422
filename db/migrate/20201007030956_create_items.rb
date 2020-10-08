class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title                     , null: false
      t.integer    :price                     , null: false
      t.text       :description               , null: false
      t.references :user, foreign_key: true   , null: false
      t.integer    :category_id               , null: false
      t.integer    :state_id                  , null: false
      t.integer    :shipping_id               , null: false
      t.integer    :area_id                   , null: false
      t.integer    :day_id                   , null: false
      t.timestamps
    end
  end
end
