class CommentsController < ApplicationController
	include CommentsHelper

	before_filter :require_login, except: [:create]

	def create
		@comment = Comment.new

		comment_params

	end 

end
