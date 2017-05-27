class Notice < ActiveRecord::Base
    def self.page_selector(page_num)
        agent = Mechanize.new
        
        page = agent.get("http://www.skku.edu/eng_home/campus/skk_comm/notice_list.jsp?page=#{page_num}&sbCode=0&skey=&keyword=") 
        contentlist ||= []
        
        
        titlelist = page.search("td.subject a")
        titlelist.each do |subject|
            title = [subject].map(&:text)[0] 
            content = subject['href']
            Notice.create(title: title, content: content ) # link_with(:text => subject).href #href 긁는게 이거밖에 없나 
        end
        
    end
    
    
    
end
