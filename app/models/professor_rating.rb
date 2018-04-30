class ProfessorRating < ApplicationRecord
	belongs_to :professor
	belongs_to :subject
	belongs_to :student

	def self.get_sum_rate(subject_id, professor_id)
		where(subject_id: subject_id, professor_id: professor_id)
		.sum(:rate)
	end

	def self.get_count_rate(subject_id, professor_id)
		where(subject_id: subject_id, professor_id: professor_id)
		.count
	end

	def self.get_rate(subject_id, professor_id, rate)
		where(subject_id: subject_id, professor_id: professor_id)
		.group(:rate)
		.having(rate: rate)
		.count
	end

	def self.check_rating_professor(option = {})
		where(subject_id: option[:subject_id], professor_id: option[:professor_id], student_id: option[:student_id])
	end
end
