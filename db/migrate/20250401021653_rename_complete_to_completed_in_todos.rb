class RenameCompleteToCompletedInTodos < ActiveRecord::Migration[8.0]
  def change
    rename_column :todos, :complete, :completed
  end
end
