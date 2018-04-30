class SubjectProfessor < ApplicationRecord
  belongs_to :subject
  belongs_to :professor
  belongs_to :status
end
