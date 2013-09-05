class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end
	
	def new
		@photo=Photo.new
	end
	
	def edit
		
	end
	
	def show
		@photo = Photo.find(params[:id])
	end
	
	def update
		
	end
	
	def destroy
		
	end
	
	def create
		@photo = Photo.new(photo_params)
			# if @photo.valid?
			
			if @photo.save
			redirect_to @photo
			else
			render :new
			end
	end

	def photo_params
			params.require(:photo).permit(:url, :name, :title, :description)
	end

end
