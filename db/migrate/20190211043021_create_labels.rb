class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.text :label_name, null: false

      t.timestamps
    end
  end
end
