class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        @user=@article.user
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(params.require(:article).permit(:title,:description))
        @article.user = User.first
        # render plain: @article.inspect
        if @article.save
            flash[:notice] = "Article was created succesfully" 
            # redirect_to article_path(@article) or
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description)
    end

end