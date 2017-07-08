class CreateDegus < ActiveRecord::Migration[5.1]
  def change
    create_table :degus do |t|
      t.string :name
      t.date :birthday
      t.text :comment
      t.references :picture

      t.timestamps
    end
  end
end
