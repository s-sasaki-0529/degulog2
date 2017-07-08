class CreateDegus < ActiveRecord::Migration[5.1]
  def change
    create_table :degus do |t|
      t.string  :name,     :null => false
      t.boolean :is_male,  :null => false
      t.date    :birthday, :null => false
      t.date    :comeDate, :null => true
      t.date    :diedDate, :null => false
      t.text    :comment,  :null => true
      t.references :picture, :null => true
      t.timestamps
    end
  end
end
