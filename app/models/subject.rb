class Subject < ApplicationRecord
	before_create :encrypt

	def encrypt
		self.sid = Digest::MD5.hexdigest(Random.new_seed.to_s + created_at.to_s);
	end
end
