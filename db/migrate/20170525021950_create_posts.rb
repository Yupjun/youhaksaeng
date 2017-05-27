class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :category_id 
      t.string :category
      t.string :campus  
      t.string :nationality 
      t.string :title
      t.text :body 
      t.string :nickname 
      t.integer :user_id 
      
      

      t.timestamps null: false
    end
  end
end
