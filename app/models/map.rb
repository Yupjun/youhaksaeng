class Map < ActiveRecord::Base
    belongs_to :facility
    
    def self.search(search)
        if search 
            where('title LIKE ?', "%#{search}%")    # LIKE 포함 / = 일치  # % % => 앞뒤에 뭐가 있든지 가져온다
        else
            all 
        end  
    end
end
