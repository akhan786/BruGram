class HashtagsController < ApplicationController
	def create
		@hashtag = Hashtag.new(params[:id])
		@photos = Photo.all
		@photos.each do |photo|
			if photo.hashtags_id = @hashtag.id
				@hashtag.photos_id = photo.id
			end
		end

		

		
	end


	def new
		@hashtag = Hashtag.new
	end

end
