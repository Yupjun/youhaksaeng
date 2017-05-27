class NoticesController < ApplicationController
    after_action :page_cleaner 
    
    def index
        agent = Mechanize.new
        page = agent.get("http://www.skku.edu/eng_home/campus/skk_comm/notice_list.jsp?bName=board_news&bCode=0")
        
        
        # last_page = page.search("a.paging[href]").map(&:text).map{|x| x[/\d+/]}[1].to_i         ## This did not work. CSS selection was wrong.  
        last_page = page.search("div.paging > a")[1]['href'].scan(/\d+/).first.to_i

        @pages_a ||= []
        for i in 1..last_page
            @pages_a.push(i)
        end

        @page_num = params[:page_to]
        @page_num ||= 1
        
        Notice.page_selector(@page_num)

        @notices = Notice.all
    end
    
    def page_cleaner
        
        Notice.delete_all
        
        # redirect_to notices_index_path
    end
    
end
