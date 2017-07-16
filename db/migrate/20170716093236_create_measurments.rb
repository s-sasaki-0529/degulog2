class CreateMeasurments < ActiveRecord::Migration[5.1]
  def change
    create_table :measurments do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
