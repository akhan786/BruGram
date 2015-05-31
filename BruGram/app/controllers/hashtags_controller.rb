class HashtagsController < ApplicationController
	def create
		@photo = Photo.find params[:id]
		@hashtags = @photo.caption.scan(/#\w+/).flatten

		@hashtags.each do |hashtag|
			@hashtag = Hashtag.new(hashtag)
			@hashtag.save

		end
	end


	def new
		@hashtag = Hashtag.new
	end

end
