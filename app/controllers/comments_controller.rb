class CommentsController < ApplicationController
	include CommentsHelper

	def create
		@comment = Comment.new

		comment_params

	end 

end
