class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :nickname
      # t.string :campus
      t.boolean :campus
      t.string :nationality
      t.boolean :email_confirmed, default: false
      t.string :confirm_token
   

      t.timestamps null: false
    end
  end
end
