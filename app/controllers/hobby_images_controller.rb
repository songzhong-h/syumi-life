class HobbyImagesController < ApplicationController
	def new
		@hobby_image = HobbyImage.new
    end

    def create
	    @hobby_image = HobbyImage.new(hobby_image_params)
	    @hobby_image.user_id = current_user.id
	    if @hobby_image.save
	      redirect_to hobby_images_path
        else
           render :new
       end
    end

    def index
    	@hobby_images  = HobbyImage.page(params[:page]).reverse_order
    end

    def show
    	@hobby_image   = HobbyImage.find(params[:id])
        @hobby_comment = HobbyComment.new
    end

    def destroy
        @hobby_image = HobbyImage.find(params[:id])
        @hobby_image.destroy
        redirect_to hobby_images_path
    end

    private
	   def hobby_image_params
	     params.require(:hobby_image).permit(:name, :image, :caption)
	   end
end