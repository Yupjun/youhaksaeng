class Category < ActiveRecord::Base
    has_many :users, through: :favorites
    has_many :posts
end
