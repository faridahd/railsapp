class CreateListitems < ActiveRecord::Migration[6.1]
  def change
    create_table :listitems do |t|
      t.string :item_name
      t.integer :item_count
      t.string :item_description

      t.timestamps
    end
  end
end
