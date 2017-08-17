# degusテーブルのis_male列を削除し、gender列を追加
# 性別:不明を扱うための処置
class ChangeColumnsFromDegus < ActiveRecord::Migration[5.1]
  def change
    remove_column :degus, :is_male
    add_column    :degus, :gender, :integer, null: false, after: :name
  end
end
