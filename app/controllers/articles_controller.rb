	class ArticlesController < ApplicationController
	include ArticlesHelper

	before_filter :require_login, except: [:index, :show]

	def index
		@articles = Article.all

		# List the three most popular articles
		@popular_articles = Article.order(:view_count).last(3)

		respond_to do |format|
			format.html
			format.rss {render :layout => false }
		end 
	end

	def show
		@article = Article.find(params[:id])
		Article.incrementation(@article)

		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new

		flash.notice = "Article '#{@article.title}' Created !"
		
		article_params
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		@article.save

		flash.notice = "Article '#{@article.title}' Destroyed !"

		redirect_to articles_path()
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		
		flash.notice = "Article '#{@article.title}' Updated !"

		article_params
	end
end
