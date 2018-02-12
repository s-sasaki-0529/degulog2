class RenameDiedDateColumnToDegus < ActiveRecord::Migration[5.1]
  def change
    rename_column :degus, :died_date, :leave_date
  end
end
