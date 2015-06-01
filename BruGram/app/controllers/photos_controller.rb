class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.save
		@hashtags = @photo.caption.scan(/#\w+/).flatten
binding.pry
		@hashtags.each do |hash|
			@hashtag = Hashtag.create(text: hash, photos_id: @photo.id)
			@photo.hashtags_id = @hashtag.id
		end
		
		if @photo.save
			@hashtag.photos_id = @photo.id	
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
		@hashtag = Hashtag.find_by photos_id: @photo.id
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



	private
	def photo_params
		params.require(:photo).permit(:caption, :image)
	end

end
