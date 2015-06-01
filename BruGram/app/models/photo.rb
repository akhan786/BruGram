class Photo < ActiveRecord::Base
	has_and_belongs_to_many :hashtags
	has_many :comments
	def liked!
		self.likes+=1
		self.save
	end

end
