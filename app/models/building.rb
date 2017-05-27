class Building < ActiveRecord::Base
    def self.search(search)
    if search 
      where('name LIKE ?', "%#{search}%")    # LIKE 포함 / = 일치  # % % => 앞뒤에 뭐가 있든지 가져온다
    else
    end  
  end
end
