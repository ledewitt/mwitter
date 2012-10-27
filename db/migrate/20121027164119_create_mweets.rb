class CreateMweets < ActiveRecord::Migration
  def up
    create_table :mweets do |t|
      t.string     :body
      t.integer    :user_id
      t.timestamps
    end
  end

  def down
    drop_table :mweets
  end
end
