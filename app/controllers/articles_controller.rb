class ArticlesController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	def index
		@articles = Article.all		
	end

	def show
		@article = Article.find(params[:id])
	end


	def new
		#byebug
		#if user_signed_in?
			@article = Article.new
		
		#end
	end


	def edit
		@article = Article.find(params[:id])
	end



	def create
	#:user_id = current_user.id 
	#byebug
	params[:article][:user_id] = current_user.id
	@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end	
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end


	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
  		
	end


private
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
 

end
