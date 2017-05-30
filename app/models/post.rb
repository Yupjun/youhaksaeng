class Post < ActiveRecord::Base
    has_many :comments
    belongs_to :category
    belongs_to :user
    # validates :title, :body, presence: true
    validates :title, length: { minimum: 2 }
    validates :body, length: { maximum: 200 }

    before_validation :strip_whitespace, only: [:title, :body]
  



  


    def self.search(search,category) #포스트 컨트롤러에 search 매소드를 넣어봤습니다. 

        if search
            where("#{category} LIKE ?","%#{search}%") 
        else
            # nil
            # none 
            all
        end
    end


    private
    
    def strip_whitespace
        self.title = self.title.strip unless self.title.nil?
    end
end
