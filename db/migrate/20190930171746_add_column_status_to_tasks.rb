class AddColumnStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :string, default: 'Not started'
  end
end
