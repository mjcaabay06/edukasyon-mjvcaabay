class SubjectProfessorStudent < ApplicationRecord
  belongs_to :subject_professor
  belongs_to :student
end
