class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :start_date, default: '2019-10-28'
      t.date :end_date, default: '2019-11-28'
      t.timestamps
    end
  end
end
