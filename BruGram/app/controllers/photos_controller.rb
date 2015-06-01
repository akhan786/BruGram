class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.save
		@hashtags = @photo.caption.scan(/#\w+/).flatten
		@hashtags.each do |hash|
			@hashtag = Hashtag.create(text: hash)
			@photo.hashtags << @hashtag
		end

		if @photo.save
			redirect_to @photo
		else
			render 'new'	
		end
	end

	def new
		@photo = Photo.new
		
		
	end

	def show
		@photo = Photo.find params[:id]
		@hashtags = @photo.hashtags
	end

	def update
		@photo = Photo.find params[:id]
		if @photo.update(photo_params)
			redirect_to @photo
		else
			render 'edit'
		end
	end	
	def edit
	@photo = Photo.find params[:id]	
	end	

	def destroy
		@photo = Photo.find params[:id]
		@photo.destroy

		redirect_to photos_path
	end	

	def like
		@photo= Photo.find params[:id]
		@photo.liked!

		redirect_to @photo
	end

	private
	def photo_params
		params.require(:photo).permit(:caption, :image)
	end

end
