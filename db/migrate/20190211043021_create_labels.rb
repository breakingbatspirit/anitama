class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.text :company, null: false

      t.timestamps
    end
  end
end
