class SearchController < ApplicationController
    def index
      
        if params[:search] == nil
            @@meta = nil
        else
            @@meta = params[:search]
        end
        
        # if params[:search] == "title"
        #     @posts = Post.where("title like ?", "%#{params[:post]}%")
        # elsif params[:search] == "body"
        #     @posts = Post.where("body like ?", "%#{params[:post]}%")
        # elsif params[:search] == "campus"
        #     @posts = Post.where("campus like ?", "%#{params[:post]}%")
        # elsif params[:search] == "nationality"
        #     @posts = Post.where("nationality like ?", "%#{params[:post]}%")
        # else
        #     @posts = Post.where("nickname like ?", "%#{params[:post]}%")
        # end
        
    end
    
    def show
        
    end

    def edit
        
    end
    private
    
    def search_params
        params.require(:search).permit(:search, :post)
    end
end
