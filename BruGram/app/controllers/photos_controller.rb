class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def create
		@photo = Photo.new(photo_params)
		@hashtags = @photo.caption.scan(/#\w+/).flatten
				@hashtags.each do |hash|
				@hashtag = Hashtag.create(text: hash, photos_id: @photo.id)

				@hashtag.save
				@photo.hashtags_id = @hashtag.id


				@photos = Photo.all
				@photos.each do |photo|
					if photo.hashtags_id = @hashtag.id
						@hashtag.photos_id = photo.id
					end
				end
				
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
