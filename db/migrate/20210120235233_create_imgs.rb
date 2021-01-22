class CreateImgs < ActiveRecord::Migration[6.1]
  def change
    create_table :imgs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :data
      t.string :url
      t.string :title
      t.integer :price

      t.timestamps
    end
  end
end
