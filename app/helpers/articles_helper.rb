module ArticlesHelper

	def article_params
		@article.title = params[:article][:title]
		@article.body = params[:article][:body]
		@article.save

		redirect_to article_path(@article)
	end

end
