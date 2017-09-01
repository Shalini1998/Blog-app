class CreateDictionaries < ActiveRecord::Migration[5.0]
  def change
    create_table :dictionaries do |t|
      t.text :title
      t.string :description

      t.timestamps
    end
  end
end
