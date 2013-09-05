class CommentsController < ApplicationController

  def create
    @photo=Photo.find(params[:photo_id])
    @comment=@photo.comments.create(comments_params)
    redirect_to @photo
  end

  def show

  end

  def comments_params
      params.require(:comment).permit(:name, :body)
  end

end
