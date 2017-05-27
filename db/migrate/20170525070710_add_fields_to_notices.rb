class AddFieldsToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :title, :string
    add_column :notices, :content, :string
  end
end
