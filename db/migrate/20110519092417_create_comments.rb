class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :email
      t.text :body
      t.datetime :comment_date
      t.integer :article_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
