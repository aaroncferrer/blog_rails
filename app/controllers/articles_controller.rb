class ArticlesController < ApplicationController
    def index
        @articles = Article.all

        render :index
    end

    def new
        @article = Article.new
    end

    def show
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(articles_params)

        if @article.img_name.present? && !image_exists?(@article.img_name.downcase)
            @article.img_name = "alt"
        end

        if @article.save
            redirect_to articles_path #index
        else
            render :new, status: 422
        end
    end 

    def update
        @article = Article.find(params[:id])

        if @article.update(articles_params)
            redirect_to show_article_path(@article) 
        else 
            render :edit, status: 422
        end
    end
    
    def delete
        @article = Article.find(params[:id])
        @article.destroy
        

        redirect_to articles_path
    end

    private

    def articles_params
        params.require(:article).permit(:name, :body, :preview, :img_name)
    end

    def image_exists?(name)
        image_path = Rails.root.join("app", "assets", "images", "#{name}.png")
        File.exist?(image_path)
    end
end
