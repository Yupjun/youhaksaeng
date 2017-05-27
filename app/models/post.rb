class Post < ActiveRecord::Base
    has_many :comments
    belongs_to :category
    belongs_to :user
    validates :title, :body, presence: true
    # def self.search(search) 
    #     if search
    #         where("#{@@meta} LIKE ?","%#{search}%") 
    #     else
    #         nil
    #     end
    # end


    def self.search(search,category) #포스트 컨트롤러에 search 매소드를 넣어봤습니다. 
        if search
            where("#{category} LIKE ?","%#{search}%") 
        else
            # nil
            none 
        end
    end
end
