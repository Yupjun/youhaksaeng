class User < ActiveRecord::Base
  before_create :confirmation_token
  rolify
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :categories, through: :favorites
  # validates :email, uniqueness: true
  validates_uniqueness_of :email
    
  def favorites_addition(user_id, category_id)
    Favorite.create(user_id: user_id, category_id: category_id)
  end

  def favorites_deletion(user_id, category_id)
    favorite = Favorite.where('user_id = ? AND category_id = ?', user_id, category_id)
    Favorite.destroy(favorite.first.id)
  end
    
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  
  private
  
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end

