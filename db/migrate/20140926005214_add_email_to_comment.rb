class AddEmailToComment < ActiveRecord::Migration
  def change
    add_column :comments, :email, :string
    add_column :comments, :name, :string
  end
end
