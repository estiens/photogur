class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end
	
	def new
		@photo=Photo.new
	end
	
	def edit
		@photo = Photo.find(params[:id])
	end
	
	def show
		@photo = Photo.find(params[:id])
	end
	
	def update
		@photo = Photo.find(params[:id])
		if @photo.update(photo_params)
			redirect_to @photo
		else
			render :edit
		end
	end
	
	def destroy
		@photo =Photo.find(params[:id])
		@photo.destroy
		redirect_to photos_path
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
			params.require(:photo).permit(:url, :name, :author, :description, :votes)
	end

	def vote_up
		@photo=Photo.find(params[:id])
		@photo.vote_up
		redirect_to @photo
	end

	def vote_down
		@photo=Photo.find(params[:id])
		@photo.vote_down
		redirect_to @photo
	end


end
