class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.text :name
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end