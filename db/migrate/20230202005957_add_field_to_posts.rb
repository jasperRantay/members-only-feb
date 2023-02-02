class AddFieldToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :body, :string
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
