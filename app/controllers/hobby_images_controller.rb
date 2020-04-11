class HobbyImagesController < ApplicationController
	def new
		@hobby_image = HobbyImage.new
    end

    def create
        @hobby_image = HobbyImage.new(hobby_image_params)
        @hobby_image.user_id = current_user.id
        if @hobby_image.save
          tags = Vision.get_image_data(@hobby_image.image)
          tags.each do |tag|
            @hobby_image.tags.create(name: tag)
          end
          redirect_to hobby_image_path(@hobby_image)
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