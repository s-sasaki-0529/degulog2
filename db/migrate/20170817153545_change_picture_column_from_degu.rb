class ChangePictureColumnFromDegu < ActiveRecord::Migration[5.1]
  def change
    remove_column :degus, :picture_id
    add_column    :degus, :picture_url, :string, after: :comment
  end
end
