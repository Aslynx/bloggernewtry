module ArticlesHelper

	def article_params
		@article.title = params[:article][:title]
		@article.body = params[:article][:body]
		@article.tag_list = params[:article][:tag_list]
		@article.save

		redirect_to article_path(@article)
	end

end
