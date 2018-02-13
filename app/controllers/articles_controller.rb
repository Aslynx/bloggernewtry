class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
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
