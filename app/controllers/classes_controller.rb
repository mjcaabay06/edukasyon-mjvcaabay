class ClassesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@subjects = Subject.all

		unless params[:query].blank?
			@subjects = @subjects.where("lower(subject_name) iLike '%#{ params[:query].downcase }%'")
		end

		@subjects = @subjects.paginate(per_page: 20, page: params[:page])
	end

	def show
		@subject = Subject.find_by(sid: params[:sid])
		@subjectProfessor = SubjectProfessor.joins(:professor).where(subject_id: @subject.id)
	end

	def create
		respond_to do |format|

			@pr = ProfessorRating.new(
				professor_id: params[:professor_id].to_i,
				subject_id: params[:subject_id].to_i,
				student_id: 3,
				rate: params[:rate].to_i,
				review_detail: params[:review_detail]
			)
			format.json { render json: { status: 'success' } }
			# if @pr.save
			# 	format.json { render json: { status: 'success' } }
			# else
			# 	format.json { render json: { status: 'error' } }
			# end
		end
	end
end
