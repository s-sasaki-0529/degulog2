class CreateWeights < ActiveRecord::Migration[5.1]
  def change
    create_table :weights do |t|
      t.references :degu, foreign_key: true
      t.date       :date
      t.integer :value

      t.timestamps
    end
  end
end
