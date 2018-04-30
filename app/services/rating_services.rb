class RatingServices
	attr_reader :subject_id, :professor_id

	def initialize(params = {})
		@subject_id = params[:subject_id]
		@professor_id = params[:professor_id]
	end

	def count_rating
		count = ProfessorRating.get_count_rate(subject_id,professor_id)
		return count
	end

	def average_rating
		one = ProfessorRating.get_rate(subject_id, professor_id,1)[1].to_i * 1
		two = ProfessorRating.get_rate(subject_id, professor_id,2)[2].to_i * 2
		three = ProfessorRating.get_rate(subject_id, professor_id,3)[3].to_i * 3
		four = ProfessorRating.get_rate(subject_id, professor_id,4)[4].to_i * 4
		five = ProfessorRating.get_rate(subject_id, professor_id,5)[5].to_i * 5
		puts "---#{one}+#{two}+#{three}+#{four}+#{five} / #{count_rating}"
		averageRating = count_rating == 0 ? 0 : (one + two + three + four + five) / count_rating.to_f

		return averageRating
	end
end