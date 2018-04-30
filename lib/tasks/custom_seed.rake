namespace :db do
	desc "Run a file in seed folder"
	task seeds: :environment  do
		filename = Dir[File.join(Rails.root, 'db', 'seeds', "#{ENV['SEED_FILE']}.seeds.rb")][0]
		puts "Seeding... #{filename}"
		if ENV['SEED_FILE'].present?
			load(filename) if File.exist?(filename)
			puts "Seeding Successful!"
		else
			abort "SEED_FILE cant be empty!"
		end
	end	
end