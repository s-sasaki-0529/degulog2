class CreateBoughts < ActiveRecord::Migration[5.1]
  def change
    create_table :boughts do |t|
      t.integer :amount
      t.string :comment
      t.string :place
      t.date :date

      t.timestamps
    end
  end
end
