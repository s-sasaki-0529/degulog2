class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :origin_id
      t.text :text
      t.integer :like_count
      t.integer :retweet_count
      t.datetime :datetime

      t.timestamps
    end
  end
end
