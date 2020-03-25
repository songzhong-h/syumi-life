class HobbyCommentsController < ApplicationController
  def create
    hobby_image = HobbyImage.find(params[:hobby_image_id])
    comment = HobbyComment.new(hobby_comment_params)
    comment.user_id = current_user.id
    comment.hobby_image_id = hobby_image.id
    comment.save
    redirect_to hobby_image_path(hobby_image)
  end

  private
    def hobby_comment_params
    params.require(:hobby_comment).permit(:comment)
    end
end