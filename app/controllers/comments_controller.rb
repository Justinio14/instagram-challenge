class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
  @image = Image.find(params[:image_id])
  @image.comments.create(review_params)
  redirect_to '/images'
end

private

def review_params
  params.require(:comment).permit(:comments)
end
end
