class ArticlesController < ApplicationController
    def index
        @articles = Article.all

        @random_article = Article.order("RANDOM()").first

        render :index
    end

    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(articles_params)

        if @article.save
            redirect_to articles_path #index
        else
            render :new, status: 422
        end
    end 

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(articles_params)
            redirect_to articles_path #index
        else 
            render :edit, status: 422
        end
    end
    
    def delete
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path # index
    end

    private

    def articles_params
        params.require(:article).permit(:name, :body)
    end
end
