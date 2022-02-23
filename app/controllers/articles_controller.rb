class ArticlesController < ApplicationController
    def index
        @articles = Article.all
        @article = Article.new
    end

    def new
        @article = Article.new
    end

    def create
        @articles = Article.all
        @article = Article.new(article_params)
    
        respond_to do |format|
            if @article.save 
                format.js 
            else
                format.html {render :index}
            end
        end

    end

    def show
        @article = Article.find(params[:id])
        @comments = @article.comments
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to articles_path
        else
            render :edit
        end
    end
    
    def delete
        Article.find(params[:id]).destroy
        redirect_to articles_path
    end 

    private 

    def article_params
        params.require(:article).permit(:name, :body)
    end
end
